class StoreModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;

  StoreModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
    );
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
    };
    return data;
  }
}
