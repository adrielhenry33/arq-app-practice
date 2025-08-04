import 'package:arq_app/app/Services/shared_local_storage_service.dart';
import 'package:arq_app/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/material.dart';

//controllers são classes

class AppController {
  static final AppController instance = AppController._();

  AppController._() {
    themeViewmodel.initStorge();
  }

  final ChangeThemeViewmodel themeViewmodel = ChangeThemeViewmodel(
    storage: SharedLocalStorageService(),
  );

  bool get isDark => themeViewmodel.config.themeSwicht.value;
  ValueNotifier<bool> get themeSwitch => themeViewmodel.config.themeSwicht;

}
