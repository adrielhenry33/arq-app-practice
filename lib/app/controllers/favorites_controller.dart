import 'package:arq_app/app/Repository/favorites_repository.dart';
import 'package:arq_app/app/models/store_model.dart';
import 'package:flutter/cupertino.dart';

class FavoritesController extends ChangeNotifier{
  final FavoritasRepository _repository;

  FavoritesController(this._repository){
    _repository.favoritesNotifier.addListener(somaProdutos);
  }

  ValueNotifier<List<StoreModel>> get favoritos =>
      _repository.favoritesNotifier;

  final soma = ValueNotifier<double>(0.0);

  

  void remove(StoreModel produto) {
    _repository.removeProduto(produto);
  }

  void add(StoreModel produto) {
    _repository.addProdutos(produto);
  }

  void somaProdutos() {
    soma.value = 0.0;
    for (var produto in _repository.favoritesNotifier.value) {
      soma.value += produto.price;
    }
  }

  void clearAllProdutos(){
    _repository.clear();
  }

   @override
  void dispose() {
    _repository.favoritesNotifier.removeListener(somaProdutos);
    soma.dispose();
    super.dispose();
  }

}
