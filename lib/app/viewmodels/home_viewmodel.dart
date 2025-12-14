import 'package:arq_app/app/Repository/favorites_repository.dart';
import 'package:arq_app/app/interfaces/store_repository_interface.dart';
import 'package:arq_app/app/models/product_model.dart';
import 'package:flutter/material.dart';

class HomeViewModel {
  final FavoritasRepository _repository;
  final StoreRepositoryInterface _storeRepository;

  HomeViewModel(this._repository, this._storeRepository);

  ValueNotifier<int> counter = ValueNotifier<int>(0);
  ValueNotifier<String> textBar = ValueNotifier<String>('Produtos');

  final products = ValueNotifier<List<ProductModel>>([]);
  final _isLoading = ValueNotifier<bool>(false);
  final selectedCategory = ValueNotifier<String>('todas');
  final selecionados = ValueNotifier<List<ProductModel>>([]);
  final data = DateTime.now();

  ValueNotifier<bool> get isLoading => _isLoading;

  Future<void> categoryProduct({String categoria = ''}) async {
    _isLoading.value = true;
    selectedCategory.value = categoria;

    try {
      final list = await _storeRepository.getStore(categoria: categoria);
      selecionados.value = list;
    } catch (e) {
      _isLoading.value = false;
    }
  }

  void addAll() {
    _repository.addAll(selecionados.value);
    resetSelected();
  }

  void resetSelected() {
    selecionados.value = [];
  }
}
