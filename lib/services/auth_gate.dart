import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_food/pages/home_page.dart';
import 'package:flutter_app_food/services/auth/login_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //if user is logged in
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const LoginRegister();
            }
          }),
    );
  }
}
