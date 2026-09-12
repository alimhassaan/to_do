import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/theme/app_constans.dart';
import 'package:to_do/features/auth/pages/login_page.dart';
import 'package:to_do/features/auth/pages/signup_page.dart';
import 'package:to_do/features/home/pages/home_page.dart';
import 'package:to_do/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: const AuthWrapper(),
      routes: {
        AppConstans.login: (context) => const LoginPage(),
        AppConstans.signup: (context) => const SignUpPage(),
        AppConstans.home: (context) => const HomePage(),
        
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // لسه بيتأكد من الحالة
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        }

        // فيه مستخدم مسجل دخول بالفعل
        if (snapshot.hasData) {
          return const HomePage();
        }

        // مفيش مستخدم - روح للوجين
        return const LoginPage();
      },
    );
  }
}