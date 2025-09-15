import 'package:arq_app/app/components/custom_bottom_bar_widget.dart';
import 'package:arq_app/app/components/custom_switch_widget.dart';
import 'package:arq_app/app/controllers/home_controller.dart';
import 'package:arq_app/app/models/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Injeções pelo metodo tradicional para pequenas aplicações
  final homeController = Modular.get<HomeController>();
  bool _isVisibleButton = false;
  String textoAppBar = '';
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [CustomSwitchWidget()],

          title: ValueListenableBuilder<String>(
            valueListenable: homeController.textAppBar,
            builder: (context, value, child) {
              return homeController.selecionadas.isEmpty
                  ? Text(
                      homeController.textAppBar.value = 'Produtos',
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(
                      homeController.textAppBar.value =
                          '${homeController.selecionadas.length} Produto(s) Selecionado(s)',
                      style: TextStyle(color: Colors.white),
                    );
            },
          ),
          backgroundColor: homeController.selecionadas.isNotEmpty
              ? Colors.blueAccent
              : Colors.deepOrangeAccent,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.vertical(
              top: Radius.circular(16),
            ),
          ),
        ),

        floatingActionButton: !_isVisibleButton
            ? Center(
                child: FloatingActionButton.large(
                  child: Icon(
                    Icons.store,
                    color: Colors.deepOrangeAccent,
                    size: 50,
                  ),
                  onPressed: () {
                    homeController.getStore();
                    setState(() {
                      _isVisibleButton = true;
                    });
                  },
                ),
              )
            : Container(),
        bottomNavigationBar: CustomBottomBarWidget(),

        body: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<List<StoreModel?>>(
                valueListenable: homeController.store,
                builder: (context, store, child) {
                  return ListView.builder(
                    itemCount: store.length,
                    itemBuilder: (context, index) {
                      final produtos = store[index];
                      if (produtos == null) {
                        return const SizedBox.shrink();
                      }
                      return Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              if (homeController.selecionadas.contains(
                                produtos,
                              )) {
                                homeController.selecionadas.remove(
                                  store[index],
                                );
                              } else {
                                homeController.selecionadas.add(produtos);
                              }
                            });
                          },
                          leading:
                              homeController.selecionadas.contains(store[index])
                              ? CircleAvatar(child: Icon(Icons.check))
                              : Image.network(produtos.image),
                          title: Text(produtos.title, style: TextStyle()),
                          subtitle: Text(produtos.category),
                          trailing: Text(
                            '\$${produtos.price.toStringAsFixed(2)}',
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
