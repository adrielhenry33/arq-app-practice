import 'package:arq_app/app/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartProductViewmodel extends StateNotifier<List<ProductModel>> {
  CartProductViewmodel() : super([]);

  void addProduct(ProductModel produto) {
    state = [...state, produto];
  }

  void removeProduct(ProductModel produto) {
    final exists = state.any((p) {
      return p.id == produto.id;
    });

    if (exists) {
      final firstOcurrence = state.indexWhere((p) {
        return p.id == produto.id;
      });
      List<ProductModel> listAux = [...state];
      listAux.removeAt(firstOcurrence);
      state = listAux;
    }
  }
}

//cerebro           //o que sera retornado
final cartProvider =
    StateNotifierProvider<CartProductViewmodel, List<ProductModel>>(
      (ref) => CartProductViewmodel(),
    );

final findOcurrenceProvider = Provider.family<int, int>((ref, id) {
  final provider = ref.watch(cartProvider);
  final ocurrence = provider.where((p) {
    return p.id == id;
  });
  return ocurrence.length;
});
