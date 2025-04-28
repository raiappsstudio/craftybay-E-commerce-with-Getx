import 'package:get/get.dart';
import '../../../../app/app_urls.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../../data/models/product_model.dart';

class ProductListController extends GetxController {

  final int _perPageDataCount = 30;
  int _currentPage = 0;

  int? _totalPage;
  int? get totalPage => _totalPage;


  bool _isInitialLoading = true;
  bool get isInitialLoading => _isInitialLoading;


  bool _isLoading = false;
  bool get isLoading => _isLoading;


  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;



  Future<bool> getProductListByCategory(String categoryId) async {
    if (_totalPage != null && _currentPage > _totalPage!) {
      return true;
    }

    bool isSuccess = false;
    _currentPage++;
    if (!_isInitialLoading) {
      _isLoading = true;
    }

    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: AppUrls.productUrl, queryParams: {
      'count': _perPageDataCount,
      'page': _currentPage,
      'category': categoryId,
    });

    if (response.isSuccess) {
      List<ProductModel> list = [];
      for (Map<String, dynamic> data in response.responseData!['data']
      ['results']) {
        list.add(ProductModel.fromJson(data));
      }
      _productList.addAll(list);
      _totalPage = response.responseData!['data']['last_page'];

      _isInitialLoading = false;
      _isLoading = false;
      _errorMessage = null;
      update();
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    if (!_isInitialLoading) {
      _isLoading = false;
    } else {
      _isInitialLoading = false;
    }

    update();

    return isSuccess;
  }

  Future<bool> refreshList(String categoryId) {
    _currentPage = 0;
    _productList = [];
    _isInitialLoading = true;
    return getProductListByCategory(categoryId);
  }
}
