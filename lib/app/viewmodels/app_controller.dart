import 'package:arq_app/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/material.dart';

//controllers são classes

class AppController {
  final ChangeThemeViewmodel changeThemeViewmodel;
  late final Future<void> _initializeFuture;

  AppController(this.changeThemeViewmodel) {
    _initializeFuture =  changeThemeViewmodel.initStorage();
  }

  Future<void> get initializationDone => _initializeFuture;
  bool get isDark => changeThemeViewmodel.config.themeSwicht.value;
  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewmodel.config.themeSwicht;
}
