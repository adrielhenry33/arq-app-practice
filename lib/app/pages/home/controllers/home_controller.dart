import 'package:arq_app/app/models/store_model.dart';
import 'package:arq_app/app/viewmodels/apistore_viewmodel.dart';
import 'package:flutter/widgets.dart';

class HomeController {
  final ApistoreViewmodel viewmodel;

  HomeController(this.viewmodel);

  ValueNotifier<StoreModel> get store => viewmodel.storeviewmodel;

  getStore() async {
    viewmodel.fillRepository();
  }
}
