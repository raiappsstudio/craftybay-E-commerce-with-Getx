import 'package:craftybay/app/app_urls.dart';
import 'package:craftybay/core/network_caller/network_caller.dart';
import 'package:craftybay/features/categories/model/category_model.dart';
import 'package:get/get.dart';


class CategoryController extends GetxController {
  bool _inprogress = false;
  bool get inProgress => _inprogress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> category(CategoryModel categoryModel) async {
    bool isSuccess = false;
    _inprogress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: AppUrls.categoriesUrl,);

    if (response.isSuccess) {
      _inprogress = false;
      update();
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
