



// Foco total na regra de negócio
import 'package:arq_app/app/models/product_model.dart';
import 'package:arq_app/providers/categorias_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final produtosProvider = FutureProvider.family<List<ProductModel>, String>((
  ref,
  categoria,
) async {
  final repository = ref.watch(produtsRepositoryyProvider);

  // O Riverpod gerencia automaticamente:
  // 🔄 Loading...
  // ✅ Data (Sucesso)
  // ❌ Error (Falha)
  return await repository.getCategory(categoria);
});
