import 'package:arq_app/app/interfaces/product_category_interface.dart';
import 'package:arq_app/app/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_modular/flutter_modular.dart';

final produtsRepositoryyProvider = Provider<IProductCategoryInterface>((ref) {
  final produtos = Modular.get<IProductCategoryInterface>();
  return produtos;
});

final productsByCategoryProvider = FutureProvider.family
    .autoDispose<List<ProductModel>, String>((ref, categoria) async {
      final lista = ref.watch(produtsRepositoryyProvider);
      return await lista.getCategory(categoria);
    });

final favoritesProvider = StateProvider.family<bool, bool>((ref, isFavorite) {
  bool isSelected = isFavorite;
  return isSelected;
});
