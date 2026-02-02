import 'package:flutter/material.dart';

class ProductReviewsComponent extends StatelessWidget {
  const ProductReviewsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Text(
                      '4.8',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        );
                      }),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '128 avaliações',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    _buildStarBar(5, 0.70),
                    _buildStarBar(4, 0.20),
                    _buildStarBar(3, 0.05),
                    _buildStarBar(2, 0.03),
                    _buildStarBar(1, 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        const Text(
          'Comentários Recentes',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'MontSerrat',
          ),
        ),
        const SizedBox(height: 15),

        _buildReviewItem(
          "Maria Silva",
          "Amei o produto! Chegou antes do prazo e a qualidade é incrível.",
          5,
          "12/08/2023",
        ),
        _buildReviewItem(
          "João Souza",
          "Bom, mas a cor é um pouco diferente da foto.",
          4,
          "10/08/2023",
        ),
        _buildReviewItem(
          "Ana Pereira",
          "Excelente custo benefício.",
          5,
          "05/08/2023",
        ),
      ],
    );
  }

  Widget _buildStarBar(int starCount, double percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            '$starCount',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.star, size: 10, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: percentage, // Valor de 0.0 a 1.0
                minHeight: 6,
                backgroundColor: Colors.grey[200],
                color: Colors.amber, // Cor da barra
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String name, String comment, int stars, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey[300],
                    child: Text(
                      name[0],
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                date,
                style: TextStyle(color: Colors.grey[500], fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                size: 16,
                color: index < stars ? Colors.amber : Colors.grey[300],
              );
            }),
          ),
          const SizedBox(height: 8),
          Text(comment, style: TextStyle(color: Colors.grey[800], height: 1.4)),
        ],
      ),
    );
  }
}
