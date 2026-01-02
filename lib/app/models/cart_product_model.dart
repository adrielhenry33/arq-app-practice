import 'package:arq_app/app/models/product_model.dart';

class CartProductModel {
  final ProductModel produto;
  final int quantidade;

  CartProductModel({required this.produto, required this.quantidade});

  CartProductModel copyWith({int? quantidade}) {
    return CartProductModel(
      produto: produto,
      quantidade: quantidade ?? this.quantidade,
    );
  }
}
