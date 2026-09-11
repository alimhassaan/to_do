import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  AuthService() {
    unawaited(_googleSignIn.initialize());
  }

  // تسجيل حساب جديد
  Future<String?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return null; // null يعني نجح من غير أخطاء
    } on FirebaseAuthException catch (e) {
      return _mapErrorMessage(e.code);
    } catch (e) {
      return 'حدث خطأ غير متوقع';
    }
  }

  // تسجيل الدخول
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return _mapErrorMessage(e.code);
    } catch (e) {
      return 'حدث خطأ غير متوقع';
    }
  }

  // تسجيل الدخول بجوجل
  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      if (googleAuth.idToken == null) {
        return 'فشل في الحصول على بيانات حساب Google';
      }

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      return null;
    } on FirebaseAuthException catch (e) {
      return _mapErrorMessage(e.code);
    } catch (e) {
      return 'حدث خطأ أثناء تسجيل الدخول بجوجل';
    }
  }

  // تسجيل الخروج
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  // معرفة لو فيه مستخدم مسجل دخول حالياً
  User? get currentUser => _auth.currentUser;

  // ترجمة رسائل الخطأ لحاجة مفهومة
  String _mapErrorMessage(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'الإيميل ده مستخدم بالفعل';
      case 'invalid-email':
        return 'صيغة الإيميل غير صحيحة';
      case 'weak-password':
        return 'كلمة المرور ضعيفة، لازم تكون 6 أحرف على الأقل';
      case 'user-not-found':
        return 'مفيش حساب بالإيميل ده';
      case 'wrong-password':
      case 'invalid-credential':
        return 'كلمة المرور غير صحيحة';
      default:
        return 'حدث خطأ: $code';
    }
  }
}