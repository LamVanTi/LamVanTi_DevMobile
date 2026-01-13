import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel?> signInWithGoogle() async {
    try {
      UserCredential userCredential;

      if (kIsWeb) {
        // ✅ WEB: KHÔNG dùng google_sign_in
        GoogleAuthProvider provider = GoogleAuthProvider();
        provider.addScope('email');
        provider.addScope('profile');

        userCredential =
        await _auth.signInWithPopup(provider);
      } else {
        // ✅ MOBILE
        // (phần này giữ nguyên nếu sau này chạy Android)
        throw UnimplementedError("Mobile not implemented");
      }

      final user = userCredential.user;
      if (user == null) return null;

      return UserModel(
        name: user.displayName ?? "No Name",
        email: user.email ?? "No Email",
        avatar: user.photoURL ?? "",
      );
    } catch (e) {
      debugPrint("LOGIN ERROR: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
