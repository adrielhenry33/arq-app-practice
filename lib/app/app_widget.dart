/*teremos uma paga que sera responsável por toda a pagina do aplicativo 
e os widgets que não serão tão vistos ou serão componentes do nosso aplicativo 
*/

import 'package:arq_app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final appController = Modular.get<AppController>();
    return ValueListenableBuilder<bool>(
      valueListenable: appController.themeSwitch,
      builder: (context, isDark, child) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: isDark ? Brightness.light : Brightness.dark,
          ),
          routerDelegate: Modular.routerDelegate,
          routeInformationParser: Modular.routeInformationParser,
        );
      },
    );
  }
}
