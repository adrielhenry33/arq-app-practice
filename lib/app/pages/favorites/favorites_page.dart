import 'package:arq_app/app/components/custom_switch_widget.dart';
import 'package:arq_app/app/controllers/favorites_controller.dart';
import 'package:arq_app/app/models/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritosController = Modular.get<FavoritesController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [CustomSwitchWidget()]),
        body: ValueListenableBuilder<List<StoreModel>>(
          valueListenable: favoritosController.favoritos,
          builder: (context, selecionadas, _) {
            if (selecionadas.isEmpty) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(50, 150, 50, 20),
                child: Column(
                  children: [
                    const Text(
                      'Seu carrinho está vazio',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextButton(
                      onPressed: () {
                        Modular.to.pop();
                      },
                      child: const Text(
                        'Confira as ofertas da nossa loja',
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Image(image: AssetImage('images/empty.png')),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: selecionadas.length,
                itemBuilder: (context, index) {
                  final produtos = selecionadas[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.fromLTRB(15, 15, 15, 10),

                    child: ListTile(
                      leading: Image.network(produtos.image),
                      title: Text(produtos.title),
                      subtitle: Text(produtos.description),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
