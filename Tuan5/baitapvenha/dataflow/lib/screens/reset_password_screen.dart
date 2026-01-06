import 'package:flutter/material.dart';
import '../models/reset_data.dart';
import 'confirm_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  final ResetData data;
  const ResetPasswordScreen({super.key, required this.data});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
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
            const Text("Create new password",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: confirmController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Confirm Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.data.password = passController.text;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ConfirmScreen(data: widget.data),
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
