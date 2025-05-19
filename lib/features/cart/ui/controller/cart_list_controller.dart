
import 'package:get/get.dart';

import '../../../../app/app_urls.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../../../auth/ui/controllers/auth_controller.dart';
import '../../models/cart_item_model.dart';

class CartListController extends GetxController {
  bool _getCartListInProgress = false;
  bool get getCartListInProgress => _getCartListInProgress;

  bool _removeFromCartListInProgress = false;
  bool get removeFromCartListInProgress => _removeFromCartListInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _removeFromCartErrorMessage;

  String? get removeFromCartErrorMessage => _removeFromCartErrorMessage;

  List<CartItemModel> _cartItemList = [];
  List<CartItemModel> get cartItemList => _cartItemList;



  Future<bool> getCartList() async {
    bool isSuccess = false;
    _getCartListInProgress = true;
    update();

    AuthController _auth = AuthController();

    print(_auth.token);


    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: AppUrls.cartListUrl,
    );

    if (response.isSuccess) {
      List<CartItemModel> list = [];
      for (Map<String, dynamic> json in response.responseData!['data']
      ['results']) {
        list.add(CartItemModel.fromJson(json));
      }
      _cartItemList = list;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _getCartListInProgress = false;
    update();
    return isSuccess;
  }

  void updateProduct(String cartId, int quantity) {
    // Normal api call
    for (CartItemModel cartItem in _cartItemList) {
      if (cartItem.id == cartId) {
        cartItem.quantity = quantity;
        break;
      }
    }
    update();
  }

  Future<bool> removeFromCart(String cartId) async {
    bool isSuccess = false;
    _removeFromCartListInProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().deleteRequest(
      url: AppUrls.deleteFromCartListUrl(cartId),
    );
    if (response.isSuccess) {
      _cartItemList.removeWhere((e) => e.id == cartId);
      isSuccess = true;
    } else {
      _removeFromCartErrorMessage = response.errorMessage;
    }
    _removeFromCartListInProgress = false;
    update();
    return isSuccess;
  }

  int get totalPrice {
    int total = 0;
    for (CartItemModel cartItem in _cartItemList) {
      total += (cartItem.productModel.currentPrice * cartItem.quantity);
    }
    return total;
  }
}