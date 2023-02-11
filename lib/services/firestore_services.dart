import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:zoom_clone/utils/constants.dart';
import 'package:zoom_clone/utils/utils.dart';

class FirestoreServices{

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createUser(String userName, String uid,String avatarUrl) async{
    try{
      await firestore.collection(userCollection).doc(uid).set({
        "userName":userName,
        "uid":uid,
        "avatarUrl":avatarUrl
      });
    }catch(e){
      throw("Something went wrong!");
      print(e.toString());
    }
  }
}