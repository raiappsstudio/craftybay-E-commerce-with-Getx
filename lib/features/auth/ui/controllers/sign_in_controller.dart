import 'package:craftybay/app/app_urls.dart';
import 'package:craftybay/core/network_caller/network_caller.dart';
import 'package:craftybay/features/auth/data/models/sign_In_model.dart';
import 'package:craftybay/features/auth/data/models/user_model.dart';
import 'package:craftybay/features/auth/ui/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../../data/models/signup_model.dart';

class SignInController extends GetxController {
  bool _inprogress = false;

  bool get inProgress => _inprogress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signIn(SignInRequestModel signInRequestModel) async {
    bool isSuccess = false;
    _inprogress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: AppUrls.signinUrl, body: signInRequestModel.tojson());

    if (response.isSuccess) {
      _inprogress = false;
      update();
      _errorMessage = null;
      isSuccess = true;
      //Save user data
      UserModel userModel =
          UserModel.fromJson(response.responseData!['data']['user']);
      //save User Token
      String accessToken = response.responseData!['data']['token'];
      await Get.find<AuthController>().saveUserData(accessToken, userModel);

    } else {
      _errorMessage = response.errorMessage;
    }

    _inprogress = false;
    update();
    return isSuccess;
  }
}
