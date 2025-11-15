import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrarionViewmodel {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final nomeController = TextEditingController();
  final sobrenomeController = TextEditingController();

  bool onException = false;
  String exceptionMessage = '';
  bool isVisible = true;

  Future<bool> signIn() async {
    try {
      final UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: senhaController.text.trim(),
          );
      final uid = user.user?.uid;
      if (uid != null) {
        await userDetails(
          nomeController.text.trim(),
          sobrenomeController.text.trim(),
          emailController.text.trim(),
          uid,
        );
      }
      return true;
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
    }
  }

  Future<bool> userDetails(
    String nome,
    String sobrenome,
    String email,
    String uid,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('datauser').doc(uid).set({
        'Nome': nome,
        'Emai': email,
        'Sobrenome': sobrenome,
        'data': FieldValue.serverTimestamp(),
      });
      return true;
    } on FirebaseAuthException catch (e) {
      exceptionMessage = 'erro ao criar o usuário contate o suporte ${e.code}';
      return false;
    }
  }
}
