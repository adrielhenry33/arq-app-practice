import 'package:arq_app/app/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesViewmodel extends StateNotifier<List<ProductModel>> {
  FavoritesViewmodel() : super([]);

  void selectedPrduct(ProductModel produto) {
    final existe = state.any((p) => p.id == produto.id);
    List<ProductModel> list = [];

    if (existe) {
      for (var item in state) {
        if (item.id != produto.id) {
          list.add(item);
        }
      }
      state = list;
    } else {
      state = [...state, produto];
    }
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesViewmodel, List<ProductModel>>((ref) {
      return FavoritesViewmodel();
    });
