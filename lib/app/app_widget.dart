/*teremos uma paga que sera responsável por toda a pagina do aplicativo 
e os widgets que não serão tão vistos ou serão componentes do nosso aplicativo 
*/

import 'package:arq_app/app/controllers/app_controller.dart';
import 'package:arq_app/app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppController.instance.themeSwicht,
      builder: (context, isDart, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(brightness: isDart ? Brightness.dark : Brightness.light),
          home: const HomePage(),
        );
      },
    );
  }
}
