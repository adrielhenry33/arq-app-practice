import 'package:arq_app/app/models/cart_product_model.dart';
import 'package:arq_app/app/models/product_model.dart';
import 'package:arq_app/app/viewmodels/cart_product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsView extends ConsumerStatefulWidget {
  final ProductModel produto;

  const DetailsView({super.key, required this.produto});

  @override
  ConsumerState<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends ConsumerState<DetailsView> {
  final pagCtrl = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    pagCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(cartProvider);
    final bool isOnCart = provider.any(
      (element) => element.produto.id == widget.produto.id,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text('Detalhes do Produto'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (!isOnCart) {
                final CartProductModel cartAux = CartProductModel(
                  produto: widget.produto,
                  quantidade: 1,
                );
                ref.read(cartProvider.notifier).addProduct(cartAux);
              }
            },
            icon: isOnCart
                ? Icon(Icons.check, size: 30, color: Colors.deepPurpleAccent)
                : Icon(
                    Icons.shopping_cart,
                    color: Colors.deepPurpleAccent,
                    size: 30,
                  ),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: pagCtrl,
                children: widget.produto.images.map((urlImage) {
                  return Image.network(
                    urlImage,
                    fit: BoxFit.fill,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Icon(Icons.error));
                    },
                  );
                }).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.produto.images.length, (index) {
                return AnimatedContainer(
                  duration: Duration(microseconds: 300),
                  curve: Curves.easeOut,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: currentIndex == index ? 25 : 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.deepPurpleAccent
                        : Colors.grey[500],
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Calcule Frete e Prazo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'MontSerrat',
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,

                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Digite seu CEP',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.deepPurpleAccent,
                              width: 2,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  MaterialButton(
                    onPressed: () {},
                    color: Colors.deepPurpleAccent,
                    height: 48,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Calcular',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
