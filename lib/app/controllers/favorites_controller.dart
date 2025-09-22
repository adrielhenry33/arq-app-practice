import 'package:arq_app/app/models/store_model.dart';
import 'package:flutter/cupertino.dart';

class FavoritesController {
  final ValueNotifier<List<StoreModel>> favoritas;

  FavoritesController(this.favoritas);

  void removerProduto(StoreModel produto) {
    final listTemp = List.from(favoritas.value);
    listTemp.remove(produto);
    favoritas.value = List.from(listTemp);
  }

  
}
