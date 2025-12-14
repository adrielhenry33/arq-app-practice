import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class RecoverViewmodel {
  final controller = TextEditingController();
  String exceptionMessage = '';

  Future<bool> resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: controller.text.trim(),
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        exceptionMessage = 'Não há nenhum usuário cadastrado com este e-mail.';
      } else {
        exceptionMessage = 'Ocorreu um erro: ${e.message}';
      }
      return false;
    }
  }
}
