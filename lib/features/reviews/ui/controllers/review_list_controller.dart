import 'package:craftybay/app/app_urls.dart';
import 'package:craftybay/core/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ReviewListController extends GetxController {
  bool _isInprogress = false;

  bool get inProgress => _isInprogress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductReview(String productId) async {
    bool isSuccess = false;

    _isInprogress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: AppUrls.reviewlistUrl(productId));


    if(response.isSuccess){



    }else{
      _errorMessage = response.errorMessage;
    }



    _isInprogress = false;
    update();
    return isSuccess;

  }
}
