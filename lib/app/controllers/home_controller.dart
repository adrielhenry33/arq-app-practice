import 'package:arq_app/app/Repository/favorites_repository.dart';
import 'package:arq_app/app/models/store_model.dart';
import 'package:arq_app/app/viewmodels/apistore_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeController {
  final ApistoreViewmodel viewmodel;
  final FavoritasRepository _repository;

  HomeController(this.viewmodel, this._repository);

  ValueNotifier<List<StoreModel?>> get store => viewmodel.storeviewmodel;
  ValueNotifier<int> counter = ValueNotifier<int>(0);
  ValueNotifier<String> textBar = ValueNotifier<String>('Produtos');
  final selecionadasTemp = ValueNotifier<List<StoreModel>>([]);

  Future<void> getStore() async {
    viewmodel.fillRepository();
  }

  void selected(StoreModel produto) {
    List<StoreModel> temp = List.from(selecionadasTemp.value);
    if (temp.contains(produto)) {
      temp.remove(produto);
    } else {
      temp.add(produto);
    }
    selecionadasTemp.value = temp;
  }

  void addAll() {
    _repository.addAll(selecionadasTemp.value);
  }

  void resetSelected() {
    selecionadasTemp.value = [];
  }
}
