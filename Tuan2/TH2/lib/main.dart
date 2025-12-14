import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Practice02(),
    );
  }
}

class Practice02 extends StatefulWidget {
  const Practice02({super.key});

  @override
  State<Practice02> createState() => _Practice02State();
}

class _Practice02State extends State<Practice02> {
  final TextEditingController _controller = TextEditingController();
  List<int> numbers = [];
  String? error;

  void createList() {
    final input = int.tryParse(_controller.text);
    if (input == null || input <= 0) {
      setState(() {
        numbers.clear();
        error = "Dữ liệu bạn nhập không hợp lệ";
      });
    } else {
      setState(() {
        error = null;
        numbers = List.generate(input, (i) => i + 1);
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TIÊU ĐỀ
              const Text(
                "Thực hành 02",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 12),

              // Ô NHẬP + NÚT TẠO
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Nhập vào số lượng",
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: createList,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Tạo"),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 16),

              // DANH SÁCH
              SizedBox(
                width: 260,
                height: 260,
                child: ListView.builder(
                  itemCount: numbers.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        numbers[index].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
