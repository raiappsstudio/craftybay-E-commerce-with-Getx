import 'package:craftybay/app/app_urls.dart';
import 'package:craftybay/core/network_caller/network_caller.dart';
import 'package:craftybay/features/products/data/models/product_model.dart';
import 'package:craftybay/features/wishlist/models/wishlist_model.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _deleteInprogress = false;

  bool get deleteInprogress => _deleteInprogress;

  bool _wishListInProgress = false;

  bool get wishlistProgress => _wishListInProgress;

  List<WishlistModel> _wishList = [];

  List<WishlistModel> get wishlist => _wishList;

  Future<bool> getWishlist() async {
    _wishList = [];
    bool isSuccess = false;
    _wishListInProgress = true;
    update();

    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(url: AppUrls.wishListUrl);

    if (response.isSuccess) {
      List<WishlistModel> list = [];

      for (Map<String, dynamic> json in response.responseData!['data']
          ['results']) {
        //WishlistModel(id: "_id",  user: "user");
        list.add(WishlistModel.fromJson(json));
      }
      _wishList.addAll(list);
      isSuccess = true;
      _wishListInProgress = false;
      update();
    } else {
      _errorMessage = response.errorMessage;
    }

    _wishListInProgress = false;
    update();

    return isSuccess;
  }

  Future<bool> deleteWishItem(String wishItemId) async {
    bool isSUccess = false;
    _deleteInprogress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().deleteRequest(
      url: AppUrls.deletewishItemUrl(wishItemId),
    );

    if (response.isSuccess) {
      _deleteInprogress = false;
      isSUccess = true;
      update();
    } else {
      _errorMessage = response.errorMessage;
    }

    _deleteInprogress = false;
    return isSUccess;
  }
}
