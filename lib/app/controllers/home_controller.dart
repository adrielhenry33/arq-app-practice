import 'package:arq_app/app/models/store_model.dart';
import 'package:arq_app/app/viewmodels/apistore_viewmodel.dart';
import 'package:flutter/widgets.dart';

class HomeController {
  final ApistoreViewmodel viewmodel;

  HomeController(this.viewmodel);

  ValueNotifier<List<StoreModel?>> get store => viewmodel.storeviewmodel;

  Future<void> getStore() async {
    viewmodel.fillRepository();
  }
}
