import 'package:arq_app/app/components/custom_switch_widget.dart';
import 'package:arq_app/app/models/product_model.dart';
import 'package:arq_app/app/viewmodels/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritosController = Modular.get<FavoritesController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(actions: [CustomSwitchWidget()]),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 4.0, color: Colors.deepOrangeAccent),
              bottom: BorderSide(width: 4.0, color: Colors.deepOrangeAccent),
            ),
          ),
          child: BottomAppBar(
            color: Color(0xFF202124),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 50),
                Icon(Icons.shopping_cart, size: 40, color: Colors.white),
                SizedBox(width: 150),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 0),

                    Text(
                      'Total de Produtos: ${favoritosController.favoritos.value.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                    ValueListenableBuilder<double>(
                      valueListenable: favoritosController.soma,
                      builder: (context, somaAtual, _) {
                        return Text(
                          'Valor Total: R\$$somaAtual',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(width: 80),
                SizedBox(
                  height: 45,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Color(0xFF202124)),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        Color(0xFFFFFFFF),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pagar - Cartão',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.credit_card, color: Colors.deepOrangeAccent),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ValueListenableBuilder<List<ProductModel>>(
          valueListenable: favoritosController.favoritos,
          builder: (context, selecionadas, _) {
            if (selecionadas.isEmpty) {
              return Center(
                //padding: const EdgeInsets.fromLTRB(50, 150, 50, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                     Image(image: AssetImage('images/empty.png'), width: 400, height: 200,),
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
                      subtitle: Text(produtos.category),
                      trailing: Text('R\$${produtos.price.toStringAsFixed(2)}'),
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
