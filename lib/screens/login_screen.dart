import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/home_screen.dart';
import 'package:zoom_clone/services/auth_services.dart';
import 'package:zoom_clone/utils/images.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or Join meeting',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38),
            child: Image.asset(
              onboarding,
            ),
          ),
          CustomButton(onTap: () async{
            bool result = await authServices.signInWithGoogle(context);
            if(!mounted) return;
            if(result  ){
              Navigator.pushNamed(context, HomeScreen.routeName);
            }
          }, buttonText: "Login")
        ],
      ),
    );
  }
}
