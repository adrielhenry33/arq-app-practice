import 'package:arq_app/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/material.dart';

//controllers são classes

class AppController {
  final ChangeThemeViewmodel changeThemeViewmodel;

  AppController(this.changeThemeViewmodel){
    changeThemeViewmodel.initStorge();
  }
  bool get isDark => changeThemeViewmodel.config.themeSwicht.value;
  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewmodel.config.themeSwicht;
}
