import 'package:craftybay/features/products/data/models/product_model.dart';

class WishlistModel {
  final String id;
  final ProductModel productModel;
  final String user;

  WishlistModel({
    required this.id,
    required this.productModel,
    required this.user,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> jsonData) {
    return WishlistModel(
      id: jsonData['_id'],
      productModel: ProductModel.fromJson(jsonData['product']),
      user: jsonData['user'],
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'product': productModel,
    'user': user,
  };

}