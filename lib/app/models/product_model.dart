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
  final List<dynamic> images;
  final String brand;
  final String sku;
  final int weight;
  final DimensionsProductoModel dimensions;
  final List<ReviewProductModel> review;
  final InformationProductModel information;
  final String thumbnail;

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
    required this.images,
    required this.dimensions,
    required this.review,
    required this.information,
    required this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
      images: List<dynamic>.from(json['images'] ?? []),
      rating: (json['rating'] as num).toDouble(),
      stock: json['stock'] ?? 0,
      tags: List<dynamic>.from(json['tags'] ?? []),
      discountPercentage: json['discountPercentage'] * 1.0,
      brand: json['brand'] ?? '',
      sku: json['sku'] ?? '',
      weight: json['weight'],
      dimensions: DimensionsProductoModel.fromjson(json['dimensions']),
      review: (json['reviews'] as List)
          .map((item) => ReviewProductModel.fromJson(item))
          .toList(),
      information: InformationProductModel(
        warrantyInformation: json['warrantyInformation'] ?? '',
        shippingInformation: json['shippingInformation'] ?? '',
        availabilityStatus: json['availabilityStatus'] ?? '',
      ),
      thumbnail: json['thumbnail'],
    );
  }
}
