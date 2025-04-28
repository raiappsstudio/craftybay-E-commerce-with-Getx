import 'package:get/get.dart';
import '../../../../app/app_urls.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../../data/models/product_model.dart';

class SpecialProductController extends GetxController {

  bool _isLoading = false;

  List<ProductModel> _productList = [];

  String? _errorMessage;

  String? get errorMessage => _errorMessage;


  List<ProductModel> get productList => _productList;

  bool get isLoading => _isLoading;


  Future<bool> getSpecialProductList() async {

    bool isSuccess = false;
    _isLoading = true;

    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: AppUrls.productUrl, queryParams: {
      'tag': "special",
    });
    if (response.isSuccess) {
      List<ProductModel> list = [];
      for (Map<String, dynamic> data in response.responseData!['data']
          ['results']) {
        list.add(ProductModel.fromJson(data));
      }
      _productList.addAll(list);


      _isLoading = false;
      _errorMessage = null;
      update();
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

      _isLoading = false;
      update();

    return isSuccess;
  }

  Future<bool> refreshList() {
    _productList = [];
    return getSpecialProductList();
  }
}
