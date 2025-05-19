import 'package:craftybay/core/network_caller/network_caller.dart';
import 'package:craftybay/features/auth/ui/controllers/auth_controller.dart';
import 'package:craftybay/features/auth/ui/controllers/sign_in_controller.dart';
import 'package:craftybay/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:craftybay/features/auth/ui/controllers/verify_otp_controller.dart';
import 'package:craftybay/features/categories/controller/category_controller.dart';
import 'package:craftybay/features/common/controllers/add_to_cart_controller.dart';
import 'package:craftybay/features/common/controllers/main_bottom_nav_bar_controller.dart';
import 'package:craftybay/features/common/controllers/home_slider_controller.dart';
import 'package:craftybay/features/products/ui/controllers/popular_new_controller.dart';
import 'package:craftybay/features/products/ui/controllers/popular_product_controller.dart';
import 'package:craftybay/features/products/ui/controllers/popular_special_controller.dart';
import 'package:craftybay/features/products/ui/controllers/product_details_controller.dart';
import 'package:craftybay/features/products/ui/controllers/productlist_controller.dart';
import 'package:craftybay/features/reviews/ui/controllers/review_list_controller.dart';
import 'package:get/get.dart';

import '../features/cart/ui/controller/cart_list_controller.dart';
import '../features/reviews/ui/controllers/create_review_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    Get.put(NetworkCaller());
    Get.put(CategoryController());
    Get.put(NewProductController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(ProductListController());
    Get.put(ProductDetailsController());
    Get.put(SignInController());
    Get.put(SignUpController());
    Get.put(VerifyOtpController());
    Get.put(HomeSliderController());
    Get.put(AuthController());
    Get.put(CartListController());
    Get.put(AddToCartController());
    Get.put(ReviewListController());
    Get.put(CreateReviewController());
   // Get.put(()=> VerifyOtpController());//laze put
  }
}
