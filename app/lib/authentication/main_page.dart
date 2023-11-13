import 'package:filter_it/app_pages/home_page.dart';
import 'package:filter_it/authentication/verify_email_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            // return const HomePage();
            return const VerifyEmailPage();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}