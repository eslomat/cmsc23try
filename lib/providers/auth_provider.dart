import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_monitoring_app/api/firebase_api_auth.dart';

class AuthProvider with ChangeNotifier {
  late FirebaseAuthAPI authService;
  late Stream<User?> _uStream;
  User? userObj;

  AuthProvider() {
    authService = FirebaseAuthAPI();
    fetchAuthentication();
  }

  Stream<User?> get userStream => _uStream;

  void fetchAuthentication() {
    _uStream = authService.getUser();

    notifyListeners();
  }

  Future<String?> signIn(String email, String password) async {
    String? feedback = await authService.signIn(email, password);
    notifyListeners();
    return feedback;
  }

  Future<void> signOut() async {
    await authService.signOut();
    notifyListeners();
  }
}
