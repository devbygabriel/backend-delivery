import 'dart:convert';

class ProductsModel {
  final int id;
  final String title;
  final String description;
  final String price;
  final String unit;
  final String picture;

  ProductsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.unit,
    required this.picture,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'unit': unit,
      'picture': picture,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? 0,
      unit: map['unit'] ?? '',
      picture: map['picture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) =>
      ProductsModel.fromMap(json.decode(source));
}
