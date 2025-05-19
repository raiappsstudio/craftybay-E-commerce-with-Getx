import 'package:craftybay/app/app_urls.dart';
import 'package:craftybay/core/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../data/models/create_review_model.dart';

class CreateReviewController extends GetxController {
  bool _inprogress = false;

  bool get inProgress => _inprogress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> createReview(CreateReviewModel createreviewModel) async {
    bool isSuccess = false;
    _inprogress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: AppUrls.createReviewUrl, body: createreviewModel.tojson());

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inprogress = false;
    update();
    return isSuccess;
  }
}
