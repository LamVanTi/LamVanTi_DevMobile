import 'package:flutter/material.dart';
import '../models/reset_data.dart';
import 'verify_code_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // The path from Step 2
              width: 100, // Optional: specify width
              height: 100, // Optional: specify height
              fit: BoxFit.cover, // Optional: control how the image fits
            ),
            const Text("SmartTasks",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text("Forget Password?"),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Your Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ResetData data = ResetData(email: emailController.text);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VerifyCodeScreen(data: data),
                  ),
                );
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
