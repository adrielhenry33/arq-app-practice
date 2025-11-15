import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class LoginViewmodel {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  String errorMessage = '';


  Future<bool> logUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: senhaController.text.trim(),
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorMessage = 'Usuario não encontrado';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Senha ou e-mail incorretos tente novamente';
      }
      return false;
    } catch (e) {
      errorMessage = 'Erro de conexão';
      return false;
    }
  }

  
}
