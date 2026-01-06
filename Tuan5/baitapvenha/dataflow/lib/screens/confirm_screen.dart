import 'package:flutter/material.dart';
import '../models/reset_data.dart';

class ConfirmScreen extends StatelessWidget {
  final ResetData data;
  const ConfirmScreen({super.key, required this.data});

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
            const Text("Confirm",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text("Email: ${data.email}"),
            Text("Code: ${data.code}"),
            Text("Password: ${data.password}"),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
