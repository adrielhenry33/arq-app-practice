import 'package:flutter/widgets.dart';

//controllers são classes

class AppController {
  /*vamos usar o singleton
  como boa pratica o singleton deve ser instanciado somente uma vez e para isso
  vamos usar um contrutor privado
  Por que usar Singleton em Flutter?
  No Flutter, usar Singleton é comum para:
  Controladores globais (como AppController, ThemeController, etc.),
  Gerenciar estado sem precisar de Provider/Riverpod/etc.,
  Garantir que uma mesma instância seja usada em toda a aplicação.
 */

  static final AppController instance = AppController._();
  AppController._();

  final themeSwicht = ValueNotifier<bool>(false);

  void changeTheme(bool value) {
    themeSwicht.value = value;
  }
}
