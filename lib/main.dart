import 'package:arq_app/app/app_module.dart';
import 'package:arq_app/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

//REGRA PRINCIPAL: TUDO NO NOSSO CODIGO DEVE TER UMA APENAS UMA RESPONSABILIDADE  

void main() {
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}



