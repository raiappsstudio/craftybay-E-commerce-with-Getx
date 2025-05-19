import 'package:craftybay/features/products/data/models/product_model.dart';

class CartItemModel {
  final String id;
  final ProductModel productModel;
  int quantity;
  final String? color;
  final String? size;

  CartItemModel(
      {required this.productModel,
      required this.quantity,
      required this.id,
      required this.color,
      required this.size});

  factory CartItemModel.fromJson(Map<String, dynamic> jsonData) {
    return CartItemModel(
        productModel: ProductModel.fromJson(jsonData['product']),
        quantity: jsonData['quantity'],
        id: jsonData['_id'],
        color: jsonData['color'],
        size: jsonData['size']);
  }
}
