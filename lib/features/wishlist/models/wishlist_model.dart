class WishlistModel {
  final String id;
  final String productId; // change from ProductModel to String
  final String user;

  WishlistModel({
    required this.id,
    required this.productId,
    required this.user,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> jsonData) {
    return WishlistModel(
      id: jsonData['_id'],
      productId: jsonData['product'], // directly assign the string
      user: jsonData['user'],
    );
  }
}
