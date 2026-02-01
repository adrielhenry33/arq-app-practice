import 'package:arq_app/app/components/cep_calculator_component.dart';
import 'package:arq_app/app/components/pop_up_component.dart';
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
  final controller = TextEditingController();
  int currentIndex = 0;

  @override
  void dispose() {
    pagCtrl.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final carrinhoProvider = ref.watch(cartProvider);

    final bool isOnCart = carrinhoProvider.any(
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
                    color: Colors.deepOrangeAccent,
                    size: 30,
                  ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.produto.title,
                    style: TextStyle(fontSize: 20, fontFamily: 'MontSerrat'),
                  ),

                  PopUpComponent(produto: widget.produto, showAllIcons: false),
                ],
              ),

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
                          ? Colors.deepOrangeAccent
                          : Colors.grey[500],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),

              Row(
                children: [
                  Text(
                    'De',
                    style: TextStyle(fontFamily: 'MontSerrat', fontSize: 20),
                  ),

                  SizedBox(width: 8),
                  Text(
                    'R\$${widget.produto.price} ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 2,
                    ),
                  ),
                  Text(
                    'por apenas',
                    style: TextStyle(fontFamily: 'MontSerrat', fontSize: 20),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.label_important, color: Colors.red),
                  Text(
                    ' R\$${widget.produto.price - widget.produto.discountPercentage}',
                    style: TextStyle(
                      fontFamily: 'MontSerrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 60,

                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                  child: Text(
                    'Comprar agora',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 60,

                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    if (isOnCart) {
                      final copy = CartProductModel(
                        produto: widget.produto,
                        quantidade: 1,
                      );

                      ref.read(cartProvider.notifier).addProduct(copy);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Produto adicionado ao carrinho'),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    side: BorderSide(color: Colors.deepOrange),
                  ),
                  child: Text(
                    'Adicionar ao carrinho',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
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

              CepCalculatorComponent(),

              SizedBox(height: 15),

              Text(
                'Descrição do Produto',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'MontSerrat',
                ),
                textAlign: TextAlign.start,
              ),

              SizedBox(height: 15),

              Text(widget.produto.description),

              SizedBox(height: 15),

              Text(
                'Avaliações',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'MontSerrat',
                ),
                textAlign: TextAlign.start,
              ),

              Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
