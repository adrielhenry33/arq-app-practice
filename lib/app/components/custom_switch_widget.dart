import 'package:arq_app/app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

//Widgets customizados como boa pratica devem ser statless ao inves de stateFull
//Sempre uma responsabilidade

class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appController = Modular.get<AppController>();
    return ValueListenableBuilder<bool>(
      valueListenable: appController.themeSwitch,
      builder: (context, isDark, child) {
        return Switch(
          value: isDark,
          onChanged: (value) {
            appController.changeThemeViewmodel.changeTheme(value);
          },
        );
      },
    );
  }
}
