import 'package:arq_app/app/models/store_model.dart';
import 'package:flutter/cupertino.dart';

class FavoritasRepository {
  final ValueNotifier<List<StoreModel>> _favoritos =
      ValueNotifier<List<StoreModel>>([]);

  ValueNotifier<List<StoreModel>> get favoritesNotifier => _favoritos;

  void addProdutos(StoreModel produto) {
    _favoritos.value = List.from(_favoritos.value)..add(produto);
  }

  void removeProduto(StoreModel produto) {
    if (_favoritos.value.contains(produto)) {
      _favoritos.value = List.from(_favoritos.value)..remove(produto);
    }
  }

  void clear() {
    _favoritos.value = [];
  }

  void addAll(List<StoreModel> model) {
    if (model.isNotEmpty) {
      _favoritos.value = List.from(model);
    }
  }
}
