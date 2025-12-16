import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const EmailCheckPage(),
    );
  }
}

class EmailCheckPage extends StatefulWidget {
  const EmailCheckPage({super.key});

  @override
  State<EmailCheckPage> createState() => _EmailCheckPageState();
}

class _EmailCheckPageState extends State<EmailCheckPage> {
  final TextEditingController _emailController = TextEditingController();
  String message = "";
  Color messageColor = Colors.red;

  void checkEmail() {
    String email = _emailController.text.trim();

    if (email.isEmpty) {
      setState(() {
        message = "Email không hợp lệ";
        messageColor = Colors.red;
      });
    } else if (!email.contains("@")) {
      setState(() {
        message = "Email không đúng định dạng";
        messageColor = Colors.red;
      });
    } else {
      setState(() {
        message = "Bạn đã nhập email hợp lệ";
        messageColor = Colors.green;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thực hành 02"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              style: TextStyle(color: messageColor),
            ),
            const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
            onPressed: checkEmail,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text(
              "Kiểm tra",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),


          ],
        ),
      ),
    );
  }
}
