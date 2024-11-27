import 'package:etapa1/data/entities/rating_model.dart';
import 'package:etapa1/domain/constants/app_constants.dart';

/// * [ProductModel] is a class that represents a product.
/// * It has the following properties:
///  * [id] - the product's ID.
///  * [title] - the product's title.
///  * [description] - the product's description.
///  * [category] - the product's category.
///  * [price] - the product's price.
///  * [image] - the product's image URL.
///  * [rating] - the product's rating.
class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.image,
    required this.rating,
  });

  ProductModel copyWith({
    int? id,
    String? title,
    String? description,
    double? price,
    String? image,
    RatingModel? rating,
    String? category,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      category: category ?? this.category,
    );
  }
  static ProductModel get dataDefault => ProductModel(
      id: 0,
      title: 'Data default',
      description: 'description default',
      category: 'category default',
      price: 0,
      image: urlPlaceholder,
      rating: RatingModel(rate: 0 , count: 0),
  );

  /// * [fromJson] is a factory method that creates a [ProductModel] instance from a JSON object.
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'].toDouble(),
      image: json['image'],
      rating: RatingModel.fromJson(json['rating']),
    );
  }

  /// * [toJson] is a method that converts a [ProductModel] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'image': image,
      'rating': rating.toJson(),
    };
  }
}
