import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrarionViewmodel {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final nomeController = TextEditingController();

  bool onException = false;
  String exceptionMessage = '';
  bool isVisible = true;

  Future<bool> signIn() async {
    bool result = false;
    try {
      final UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: senhaController.text.trim(),
          );
      final uid = user.user?.uid;
      if (uid != null) {
        result = await userDetails(
          nomeController.text.trim(),
          emailController.text.trim(),
          uid,
        );
      }
      if (result) return true;
      return false;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          exceptionMessage = 'O formato do e-mail é inválido.';
          break;
        case 'email-already-in-use':
          exceptionMessage = 'Este e-mail já está cadastrado.';
          break;
        case 'weak-password':
          exceptionMessage =
              'A senha é muito fraca. Tente uma senha mais forte.';
          break;
        case 'network-request-failed':
          exceptionMessage = 'Sem conexão com a internet. Verifique sua rede.';
          break;
        default:
          exceptionMessage = 'Ocorreu um erro desconhecido: ${e.message}';
      }
      return false;
    } on FirebaseException catch (e) {
      exceptionMessage = e.code;
      return false;
    }
  }

  Future<bool> userDetails(String nome, String email, String uid) async {
    try {
      await FirebaseFirestore.instance.collection('usuarios').doc(uid).set({
        'Nome': nome,
        'Email': email,
        'data': FieldValue.serverTimestamp(),
      });
      return true;
    } on FirebaseException catch (e) {
      exceptionMessage = 'erro ao criar o usuário contate o suporte ${e.code}';
      return false;
    }
  }
}
