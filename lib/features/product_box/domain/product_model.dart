import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 2)
class ProductModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String image;
  @HiveField(6)
  final double ratingValue;
  @HiveField(7)
  final int ratingCount;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.ratingValue,
    required this.ratingCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['category'],
      image: json['image'],
      ratingValue: json['rating']['rate'].toDouble(),
      ratingCount: json['rating']['count'],
    );
  }

  // ✅ Override equality for testing and comparison
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          price == other.price &&
          category == other.category &&
          image == other.image &&
          ratingValue == other.ratingValue &&
          ratingCount == other.ratingCount;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      price.hashCode ^
      category.hashCode ^
      image.hashCode ^
      ratingValue.hashCode ^
      ratingCount.hashCode;
}
