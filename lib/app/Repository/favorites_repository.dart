import 'package:arq_app/app/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class FavoritasRepository {
  List<ProductModel> _favoritos = [];

  void addProdutos(ProductModel produto) {
    _favoritos.add(produto);
  }

  void removeProduto(ProductModel produto) {
    if (_favoritos.contains(produto)) {
      _favoritos.remove(produto);
    }
  }

  void clear() {
    _favoritos.clear();
  }

  void addAll(List<ProductModel> lista) {
    if (lista.isNotEmpty) {
      _favoritos = List.from(lista);
      _favoritos.addAll(lista);
    }
  }
}
