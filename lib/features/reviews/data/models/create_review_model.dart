class CreateReviewModel {

  final String id;
  final String comment;
  final String rating;


  CreateReviewModel({required this.id,
    required this.comment,
    required this.rating,
  });

  Map<String, dynamic> tojson() {
    return {
      "product": id,
      "comment": comment,
      "rating": rating,
    };
  }
}