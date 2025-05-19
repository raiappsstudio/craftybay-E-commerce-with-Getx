import 'package:craftybay/features/auth/data/models/user_model.dart';
import 'package:craftybay/features/products/data/models/product_model.dart';

class ReviewsModel {
  final String id;
  final ProductModel productModel;
  final UserModel userModel;
  final String rating;
  final String comment;

  ReviewsModel(
      {required this.id,
      required this.productModel,
      required this.userModel,
      required this.rating,
      required this.comment});

  factory ReviewsModel.fromJson(Map<String, dynamic> jsonData) {
    return ReviewsModel(
        id: jsonData['_id'],
        productModel: ProductModel.fromJson(jsonData['product']),
        userModel: UserModel.fromJson(jsonData['user']),
        rating: jsonData['rating'],
        comment: jsonData['comment']);
  }
}
