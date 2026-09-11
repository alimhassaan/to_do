import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const CustomButtom({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3DDC97),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(8),
            const Icon(Icons.arrow_forward, color: Colors.black, size: 18),
          ],
        ),
      ),
    );
  }
}
