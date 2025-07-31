/*teremos uma paga que sera responsável por toda a pagina do aplicativo 
e os widgets que não serão tão vistos ou serão componentes do nosso aplicativo 
*/


import 'package:arq_app/app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        brightness: Brightness.dark
      ),
      home: const HomePage(),
    );
  }
}
