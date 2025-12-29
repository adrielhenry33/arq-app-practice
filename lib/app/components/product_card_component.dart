import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCardComponent extends ConsumerWidget {
  final String image;
  final String nome;
  final double preco;

  const ProductCardComponent({
    super.key,
    required this.image,
    required this.nome,
    required this.preco,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color corContexto = Theme.of(
      context,
    ).colorScheme.outline.withValues(alpha: 0.5);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: corContexto),
            ),
            child: Image(image: NetworkImage(image), fit: BoxFit.fitWidth),
          ),
        ),
        SizedBox(height: 10),
        Text(nome, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        SizedBox(height: 4),

        Text(
          '\$$preco',
          style: TextStyle(fontSize: 15),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.deepPurple,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_shopping_cart, color: Colors.white),
              ),
            ),
            SizedBox(width: 10),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withValues(alpha: 0.1),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_outline),
              ),
            ),
            SizedBox(width: 10),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withValues(alpha: 0.1),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_outlined),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
