import 'package:arq_app/app/Services/shared_local_storage_service.dart';
import 'package:arq_app/app/interfaces/local_storage_interface.dart';
import 'package:arq_app/app/models/app_config_model.dart';
import 'package:arq_app/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/material.dart';

//controllers são classes
/*vamos usar o singleton
  como boa pratica o singleton deve ser instanciado somente uma vez e para isso
  vamos usar um contrutor privado
  Por que usar Singleton em Flutter?
  No Flutter, usar Singleton é comum para:
  Controladores globais (como AppController, ThemeController, etc.),
  Gerenciar estado sem precisar de Provider/Riverpod/etc.,
  Garantir que uma mesma instância seja usada em toda a aplicação.
 */
class AppController {
  static final AppController instance = AppController._();

  AppController._(){
    themeViewmodel.initStorge();
  };
 

  final ChangeThemeViewmodel themeViewmodel ;

  bool get isDark => themeViewmodel.config.themeSwicht.value;
  ValueNotifier<bool> get themeSwitch => themeViewmodel.config.themeSwicht;

  //repare que aqui eu instancio uma varivel do tipo da classe abstrata que re
  // cebe a instancia da classe shared que contem a implementação dos metodos 
  // definidos dentro da classe abstrata que no caso é o LocalStorageInterface
  final LocalStorageInterface storageInterface = SharedLocalStorageService();

  
}
