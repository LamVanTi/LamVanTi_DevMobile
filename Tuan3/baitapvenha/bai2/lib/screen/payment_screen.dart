import 'package:flutter/material.dart';
import '../models/payment_method.dart';
import '../widgets/payment_item.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<PaymentMethod> methods = [
    PaymentMethod(id: 1, name: "PayPal", icon: "assets/paypal.png"),
    PaymentMethod(id: 2, name: "Google Pay", icon: "assets/googlepay.png"),
    PaymentMethod(id: 3, name: "Apple Pay", icon: "assets/applepay.png"),
  ];

  void selectMethod(int id) {
    setState(() {
      for (var m in methods) {
        m.isSelected = m.id == id;
      }
    });
  }

  PaymentMethod? get selectedMethod {
    try {
      return methods.firstWhere((e) => e.isSelected);
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),

              /// ICON TRÊN CÙNG (ĐỔI THEO PHƯƠNG THỨC)
              Image.asset(
                selectedMethod == null
                    ? "assets/car.png"
                    : selectedMethod!.icon,
                width: 80,
              ),

              const SizedBox(height: 30),

              /// DANH SÁCH THANH TOÁN
              ...methods.map(
                    (e) => PaymentItem(
                  method: e,
                  onTap: () => selectMethod(e.id),
                ),
              ),

              const Spacer(),

              /// BUTTON CONTINUE
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed:
                  selectedMethod == null ? null : () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    disabledBackgroundColor:
                    Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16, color: Colors.white),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
