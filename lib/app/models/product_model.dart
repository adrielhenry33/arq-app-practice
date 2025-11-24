import 'package:arq_app/app/models/dimensions_producto_model.dart';
import 'package:arq_app/app/models/information_product_model.dart';
import 'package:arq_app/app/models/review_product_model.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<dynamic> tags;
  final String image;
  final String brand;
  final String sku;
  final int weight;
  final DimensionsProductoModel dimensions;
  final List<ReviewProductModel> review;
  final InformationProductModel information;

  ProductModel({
    required this.brand,
    required this.sku,
    required this.weight,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.id,
    required this.title,
    required this.price,
    required this.discountPercentage,
    required this.description,
    required this.category,
    required this.image,
    required this.dimensions,
    required this.review,
    required this.information,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: (json['rating'] as num).toDouble(),
      stock: json['stock'] ?? 0,
      tags: List<dynamic>.from(json['tags'] ?? []),
      discountPercentage: json['discountPercentage'],
      brand: json['brand'] ?? '',
      sku: json['sku'] ?? '',
      weight: json['weight'],
      dimensions: DimensionsProductoModel.fromjson(json['dimensions']),
      review: (json['review'] as List)
          .map((item) => ReviewProductModel.fromJson(item))
          .toList(),
      information: InformationProductModel(
        warrantyInformation: json['warrantyInformation'] ?? '',
        shippingInformation: json['shippingInformation'] ?? '',
        availabilityStatus: json['availabilityStatus'] ?? '',
      ),
    );
  }
 
}
