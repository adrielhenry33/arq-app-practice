import 'package:arq_app/app/Repository/favorites_repository.dart';
import 'package:arq_app/app/models/store_model.dart';
import 'package:flutter/cupertino.dart';

class FavoritesController {
  final FavoritasRepository _repository;

  FavoritesController(this._repository);

  ValueNotifier<List<StoreModel>> get favoritos =>
      _repository.favoritesNotifier;

  void remove(StoreModel produto) {
    _repository.removeProduto(produto);
  }

  void add(StoreModel produto) {
    _repository.addProdutos(produto);
  }

  
}
