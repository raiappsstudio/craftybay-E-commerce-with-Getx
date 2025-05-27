import 'dart:convert';
import 'package:craftybay/app/app_urls.dart';
import 'package:craftybay/core/network_caller/network_caller.dart';
import 'package:craftybay/features/reviews/data/models/reviews_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' as getx;
import 'package:http/http.dart';

import '../../../auth/ui/controllers/auth_controller.dart';

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


    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: AppUrls.reviewlistUrl(productId));

    if (response.isSuccess) {
      List<ReviewsModel> list = [];
      for (Map<String, dynamic> json in response.responseData!['data']
          ['results']) {
        list.add(ReviewsModel.fromJson(json));
      }
      _reviewsList.addAll(list);
      _reviewsList = list;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _isInprogress = false;
    update();
    return isSuccess;
  }




  /*///Data niye aschi=====================
  Future<NetworkResponse> getRequest(
      {required String url, Map<String, dynamic>? queryParams}) async {
    try {
      url += '';

      for (String key in queryParams?.keys ?? {}) {
        url += '$key=${queryParams![key]}&';
      }


      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'token': getx.Get.find<AuthController>().token ?? ''
      };


      var response = await get(uri, headers: headers);

      final decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedResponse);
      } else if (response.statusCode == 401) {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: decodedResponse['msg']);
      } else {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: decodedResponse['msg']);
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }
*/
}
