import 'package:craftybay/app/app_urls.dart';
import 'package:craftybay/core/network_caller/network_caller.dart';
import 'package:craftybay/features/wishlist/models/wishlist_model.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _wishListInProgress = false;

  bool get wishlistProgress => _wishListInProgress;

  List<WishlistModel> _wishList = [];

  List<WishlistModel> get wishlist => _wishList;

  Future<bool> getWishlist() async {
    bool isSuccess = false;
    _wishListInProgress = true;
    update();

    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(url: AppUrls.wishListUrl);

    if (response.isSuccess) {
      List<WishlistModel> list = [];

      for (Map<String, dynamic> json in response.responseData!['data']
          ['results']) {
        list.add(WishlistModel.fromJson(json));
      }

      _wishList = list;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _wishListInProgress = false;
    update();

    return isSuccess;
  }
}
