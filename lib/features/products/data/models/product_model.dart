/*
import 'brand_model.dart';

class ProductModel {
  final String sId;
  final String title;
  final Brand brand;
  final String slug;
  //final String metaDescription;
  final String description;
  final int regularPrice;
  final int currentPrice;
  final int quantity;
  final String createdAt;
  final String updatedAt;

  //final List<Categories>? categories;
  final List<String> photos;
  final List<String> colors;
  final List<String> sizes;
  //final List<String>? tags;

  ProductModel(
      {required this.sId,
      required this.title,
      required this.brand,
      required this.slug,
     // required this.metaDescription,
      required this.description,
      required this.regularPrice,
      required this.currentPrice,
      required this.quantity,
      required this.createdAt,
      required this.updatedAt,
      //required this.categories,
      required this.photos,
      required this.colors,
      required this.sizes,
      //required this.tags
      });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {

    List<dynamic> photoList = jsonData['photos'];
    List<dynamic> sizeList = jsonData['sizes'];
    List<dynamic> colorList = jsonData['colors'];



    return ProductModel(
      sId: jsonData['_id'],
      title: jsonData['title'],
      brand: Brand.fromJson(jsonData['brand']),
      slug: jsonData['slug'],
     // metaDescription: jsonData['meta_description'],
      description: jsonData['description'],
      regularPrice: jsonData['regular_price']?? 0,
      currentPrice: jsonData['current_price'],
      quantity: jsonData['quantity'],
      createdAt: jsonData['createdAt'],
      updatedAt: jsonData['updatedAt'],
      //categories: jsonData['categories'],
      photos: List<String>.from(photoList),
      colors: List<String>.from(colorList),
      sizes: List<String>.from(sizeList),
      //tags: jsonData['tags'],
    );
  }
}


*/


import 'package:craftybay/features/products/data/models/brand_model.dart';

class ProductModel {
  final String id;
  final String title;
  final Brand brand;
  final int regularPrice;
  final int currentPrice;
  final double rating;
  final List<String> photos;
  final List<String> sizes;
  final List<String> colors;
  final int availableQuantity;

  ProductModel(
      {required this.id,
        required this.title,
        required this.brand,
        required this.regularPrice,
        required this.currentPrice,
        required this.rating,
        required this.photos,
        required this.sizes,
        required this.colors,
        required this.availableQuantity});

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    List<dynamic> photoList = jsonData['photos'];
    List<dynamic> sizeList = jsonData['sizes'];
    List<dynamic> colorList = jsonData['colors'];

    return ProductModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      brand: Brand.fromJson(jsonData['brand']),
      regularPrice: jsonData['regular_price'] ?? 0,
      currentPrice: jsonData['current_price'],
      rating: jsonData['rating'] ?? 0.0,
      photos: List<String>.from(photoList),
      sizes: List<String>.from(sizeList),
      colors: List<String>.from(colorList),
      availableQuantity: jsonData['quantity'],
    );
  }
}