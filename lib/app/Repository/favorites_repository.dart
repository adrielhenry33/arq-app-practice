import 'package:arq_app/app/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class FavoritasRepository {
  final ValueNotifier<List<ProductModel>> _favoritos =
      ValueNotifier<List<ProductModel>>([]);

  ValueNotifier<List<ProductModel>> get favoritesNotifier => _favoritos;

  void addProdutos(ProductModel produto) {
    _favoritos.value = List.from(_favoritos.value)..add(produto);
  }

  void removeProduto(ProductModel produto) {
    if (_favoritos.value.contains(produto)) {
      _favoritos.value = List.from(_favoritos.value)..remove(produto);
    }
  }

  void clear() {
    _favoritos.value = [];
  }

  void addAll(List<ProductModel> model) {
    if (model.isNotEmpty) {
      _favoritos.value = List.from(_favoritos.value)..addAll(model);
    }
  }
}
