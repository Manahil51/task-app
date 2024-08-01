import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskk/screens/home/bottom_navigation/message.dart';
import 'package:taskk/screens/login_signup/loginpage.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key}); // Added the constructor call

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MessageScreen();
          } else {
            return const LOginPage(); // Corrected the typo
          }
        },
      ),
    );
  }
}
