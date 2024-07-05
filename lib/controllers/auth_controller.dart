import 'package:chat/services/auth_firebase_services.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  final _firebaseAuthService = AuthFirebaseServices();

  Future<void> register({
    required email,
    required password,
  }) async {
    await _firebaseAuthService.register(
      email: email,
      password: password,
    );
    notifyListeners();
  }
  

  Future<void> login({
    required email,
    required password,
  }) async {
    await _firebaseAuthService.login(email: email, password: password);
    notifyListeners();
  }

  Future<void> signOut() async {
    await _firebaseAuthService.signOut();
    notifyListeners();
  }
}
