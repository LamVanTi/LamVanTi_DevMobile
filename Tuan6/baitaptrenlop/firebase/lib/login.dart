import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authservice.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  User? user;

  void login() async {
    try {
      final result = await AuthService().signInWithGoogle();
      setState(() => user = result);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Success!\nHi ${result!.email}\nWelcome to UTHSmartTasks",
          ),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Google Sign-In Failed"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void logout() async {
    await AuthService().signOut();
    setState(() => user = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Auth")),
      body: Center(
        child: user == null
            ? ElevatedButton(
          onPressed: login,
          child: const Text("Login by Gmail"),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Email: ${user!.email}"),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: logout,
              child: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
