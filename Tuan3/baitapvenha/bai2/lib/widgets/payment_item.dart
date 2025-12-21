import 'package:flutter/material.dart';
import '../models/payment_method.dart';

class PaymentItem extends StatelessWidget {
  final PaymentMethod method;
  final VoidCallback onTap;

  const PaymentItem({
    super.key,
    required this.method,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: method.isSelected
                ? Colors.blue
                : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Image.asset(method.icon, width: 40),
            const SizedBox(width: 12),
            Text(
              method.name,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Icon(
              method.isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
