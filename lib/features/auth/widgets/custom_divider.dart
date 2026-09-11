import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required Color color});

  @override
  Widget build(BuildContext context) {
    return Row(
  children: [
    Expanded(
      child: Divider(color: Colors.white.withValues(alpha: 0.15)),
    ),
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        'or',
        style: TextStyle(color: Colors.white54, fontSize: 13),
      ),
    ),
    Expanded(
      child: Divider(color: Colors.white.withValues(alpha: 0.15)),
    ),
  ],
);
  }
}