import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomBottomBarWidget extends StatefulWidget {
  const CustomBottomBarWidget({super.key});

  @override
  State<CustomBottomBarWidget> createState() => _CustomBottomBarWidgetState();
}

class _CustomBottomBarWidgetState extends State<CustomBottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.deepOrangeAccent,
      shape: CircularNotchedRectangle(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, color: Colors.white, size: 30),
              color: Colors.white,
              tooltip: 'Adicionar Produto',
            ),
            IconButton(
              onPressed: () {
                Modular.to.pushReplacementNamed('/products');
              },
              icon: Icon(Icons.shopping_cart, color: Colors.white, size: 30),
              color: Colors.white,
              tooltip: 'Ver Carrinho',
            ),
          ],
        ),
      ),
    );
  }
}
