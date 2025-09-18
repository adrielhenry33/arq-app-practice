import 'package:arq_app/app/models/store_model.dart';
import 'package:arq_app/app/viewmodels/apistore_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeController {
  final ApistoreViewmodel viewmodel;

  HomeController(this.viewmodel);

  ValueNotifier<List<StoreModel?>> get store => viewmodel.storeviewmodel;

  ValueNotifier<int> counter = ValueNotifier<int>(0);
  ValueNotifier<String> textBar = ValueNotifier<String>('Produtos');
  final selecionadas = ValueNotifier<List<StoreModel>>([]);

  Future<void> getStore() async {
    viewmodel.fillRepository();
  }

  void toggleSelected(StoreModel produto) {
    List<StoreModel> lista = List.from(selecionadas.value);

    if (lista.contains(produto)) {
      lista.remove(produto);
    } else {
      lista.add(produto);
    }
    selecionadas.value = lista;
  }

  void resetSelected() {
    selecionadas.value = [];
  }
}
