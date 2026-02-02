import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarrinhoView extends ConsumerStatefulWidget {
  const CarrinhoView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CarrinhoView();
}

class _CarrinhoView extends ConsumerState<CarrinhoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.deepOrangeAccent));
  }
}
