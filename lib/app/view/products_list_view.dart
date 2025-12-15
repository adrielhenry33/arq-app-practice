import 'package:arq_app/providers/categorias_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsListView extends ConsumerWidget {
  final String nomeCategoria;
  final String titulo;

  const ProductsListView({
    super.key,
    required this.nomeCategoria,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final provider = ref.watch(produtsByCategoryProvider(nomeCategoria));

    return Scaffold(
      
    );
  }
}
