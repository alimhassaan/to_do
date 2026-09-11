import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
        ),
        icon: Image.asset(
          'assets/images/google_logo.png',
          width: 30,
          height: 30,
        ),
        label: const Text(
          'Continue with Google',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
