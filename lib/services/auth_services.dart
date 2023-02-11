import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone/services/firestore_services.dart';
import 'package:zoom_clone/utils/utils.dart';

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirestoreServices firestoreServices = FirestoreServices();

  Stream<User?> get authChange => firebaseAuth.authStateChanges();

  Future<bool> signInWithGoogle(BuildContext context) async {
    bool result = false;
    try {
      final GoogleSignInAccount? googleAccount = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleAccount?.authentication;

      // create credential
      final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication?.accessToken,
          idToken: googleSignInAuthentication?.idToken);

      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);

      User? user = userCredential.user;

      if (user != null) {
        // if new user, save user data
        if (userCredential.additionalUserInfo!.isNewUser) {
          await firestoreServices.createUser(
            user.displayName ?? "",
            user.uid,
            user.photoURL ?? "",
          );
        }
        result = true;
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      result = false;
    } catch (e) {
      showSnackBar(context, "Something went wrong!");
    }
    return result;
  }
}
