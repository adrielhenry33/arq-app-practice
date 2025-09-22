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
  final homeController = Modular.get<HomeController>();
  bool _isVisibleButton = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: ValueListenableBuilder<List<StoreModel>>(
            valueListenable: homeController.selecionadas,
            builder: (context, selecionadas, child) {
              final bool hasSelection = selecionadas.isNotEmpty;

              homeController.textBar.value = hasSelection
                  ? '${selecionadas.length} Produto(s) Selecionado(s)'
                  : 'Produtos';

              return AppBar(
                actions: [CustomSwitchWidget()],
                title: Text(
                  homeController.textBar.value,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: hasSelection
                    ? Colors.blueAccent
                    : Colors.deepOrangeAccent,
                centerTitle: true,
              );
            },
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

        bottomNavigationBar: ValueListenableBuilder<List>(
          valueListenable: homeController.selecionadas,
          builder: (context, selecionadas, _) {
            final hasSelected = homeController.selecionadas.value.isNotEmpty;
            return BottomAppBar(
              color: hasSelected ? Colors.blueAccent : Colors.deepOrangeAccent,
              shape: CircularNotchedRectangle(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        minimumSize: Size(150, 150),
                      ),
                      onPressed: () {
                        if (hasSelected) {
                          homeController.resetSelected();
                        } else {
                          null;
                        }
                      },
                      child: Icon(Icons.add, color: Colors.white, size: 30),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        minimumSize: Size(150, 150),
                      ),
                      onPressed: () {
                        Modular.to.pushNamed('/favorites');
                      },
                      child: Icon(
                        Icons.shopping_cart_checkout_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),

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
                      return ValueListenableBuilder<List<StoreModel>>(
                        valueListenable: homeController.selecionadas,
                        builder: (context, selecionadas, _) {
                          final isSelected = selecionadas.contains(produtos);
                          return Card(
                            elevation: 4,
                            margin: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                            child: ListTile(
                              onTap: () {
                                homeController.toggleSelected(produtos);
                              },
                              leading: isSelected
                                  ? const CircleAvatar(child: Icon(Icons.check))
                                  : Image.network(produtos.image),
                              title: Text(produtos.title),
                              subtitle: Text(produtos.category),
                              trailing: Text(
                                '\$${produtos.price.toStringAsFixed(2)}',
                              ),
                            ),
                          );
                        },
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
