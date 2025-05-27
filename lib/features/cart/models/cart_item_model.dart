/*
import '../../products/data/models/product_model.dart';

class CartItemModel {
  final String id;
  final ProductModel productModel;
  int quantity;
  final String? color;
  final String? size;

  CartItemModel(
      {required this.productModel,
        required this.id,
        required this.quantity,
        required this.color,
        required this.size});

  factory CartItemModel.fromJson(Map<String, dynamic> jsonData) {
    return CartItemModel(
      id: jsonData['_id'],
      productModel: ProductModel.fromJson(jsonData['product']),
      quantity: jsonData['quantity'],
      color: jsonData['color'],
      size: jsonData['size'],
    );
  }
}*/

import '../../products/data/models/product_model.dart';

class CartItemModel {
  String id;
  ProductModel productModel;
  int quantity;

  CartItemModel({
    required this.id,
    required this.productModel,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['_id'],
      quantity: json['quantity'],
      productModel: ProductModel.fromJson(json['product']),
    );
  }
}
