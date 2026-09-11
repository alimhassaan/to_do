import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do/core/theme/app_constans.dart';
import 'package:to_do/features/auth/pages/login_page.dart';
import 'package:to_do/features/auth/pages/signup_page.dart';
import 'package:to_do/firebase_options.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      initialRoute: AppConstans.login,
      routes: {
        AppConstans.login: (context) => const LoginPage(),
        AppConstans.signup: (context) => const SignUpPage(),
      },
    );
  }
}
