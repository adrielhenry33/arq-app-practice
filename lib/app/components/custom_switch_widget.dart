import 'package:flutter/material.dart';

//Widgets customizados como boa pratica devem ser statless ao inves de stateFull 
//Sempre uma responsabilidade

class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(value: false, onChanged: (value) {
      
    },);
  }
}