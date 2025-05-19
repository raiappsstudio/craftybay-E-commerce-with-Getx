import 'package:craftybay/app/app_urls.dart';
import 'package:craftybay/core/network_caller/network_caller.dart';
import 'package:craftybay/features/reviews/data/models/reviews_model.dart';
import 'package:craftybay/features/wishlist/models/wishlist_model.dart';
import 'package:get/get.dart';

class ReviewListController extends GetxController {
  bool _isInprogress = false;

  bool get inProgress => _isInprogress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  List<ReviewsModel> _reviewsList = [];

  List<ReviewsModel> get reviewsList => _reviewsList;

  Future<bool> getProductReview(String productId) async {
    bool isSuccess = false;
    _isInprogress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: AppUrls.reviewlistUrl(productId));

    if (response.isSuccess) {
      List<ReviewsModel> list = [];
      for (Map<String, dynamic> json in response.responseData!['data']
          ['results']) {
        list.add(ReviewsModel.fromJson(json));
      }
      _reviewsList = list;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _isInprogress = false;
    update();
    return isSuccess;
  }
}
