import 'package:etapa1/core/domain/entities/rating_model.dart';

class ProductModel{
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
  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      image: json['image'],
      rating: RatingModel.fromJson(json['rating']),
    );
  }

  Map<String, dynamic> toJson(){
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