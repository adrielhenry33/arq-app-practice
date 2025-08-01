import 'package:arq_app/app/controllers/app_controller.dart';
import 'package:flutter/material.dart';

//Widgets customizados como boa pratica devem ser statless ao inves de stateFull 
//Sempre uma responsabilidade

class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(value: AppController.instance.themeSwicht.value, onChanged: (value) {
      AppController.instance.changeTheme(value);
    },);
  }
}