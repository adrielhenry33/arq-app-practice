import 'package:arq_app/app/components/custom_switch_widget.dart';
import 'package:arq_app/app/controllers/home_controller.dart';
import 'package:arq_app/app/models/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPage();
}

class _FavoritesPage extends State<FavoritesPage> {
  final favoritas = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [CustomSwitchWidget()]),
        body: favoritas.selecionadas.value.isEmpty
            ? Padding(
                padding: EdgeInsetsGeometry.fromLTRB(50, 150, 50, 20),
                child: Column(
                  children: [
                    Text(
                      'Seu carrinho está vazio',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 5),
                    TextButton(
                      onPressed: () {
                        Modular.to.pop('/home');
                      },
                      child: Text(
                        'Confira as ofertas da nossa loja',
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ),
                    ),

                    SizedBox(height: 5),
                    Image(image: AssetImage('images/empty.png')),
                  ],
                ),
              )
            : ValueListenableBuilder<List<StoreModel>>(
                valueListenable: favoritas.selecionadas,

                builder: (context, selecionadas, _) {
                  return ListView.builder(
                    itemCount: selecionadas.length,
                    itemBuilder: (context, index) {
                      final produtos = selecionadas[index];
                      return Card(
                        child: ListTile(leading: Image.network(produtos.image)),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
