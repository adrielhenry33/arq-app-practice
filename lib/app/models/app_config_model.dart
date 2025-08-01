import 'package:flutter/material.dart';

/*O que é a pasta model?
Em arquiteturas de software como MVC (Model-View-Controller) 
ou MVVM (Model-View-ViewModel), a pasta model é a camada responsável por 
representar os dados e a lógica de negócios da sua aplicação.

O "modelo" é a parte que lida com a informação.
Ele não sabe como a informação é apresentada na tela (View) ou como o 
usuário interage com ela (Controller ou ViewModel).
Ele simplesmente armazena e manipula os dados. */

class AppConfigModel {
  final themeSwicht = ValueNotifier<bool>(false);
}
