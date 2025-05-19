import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/core/widgets/centered_circular_progressbar.dart';
import 'package:craftybay/core/widgets/show_snack_bar_message.dart';
import 'package:craftybay/features/auth/ui/controllers/auth_controller.dart';
import 'package:craftybay/features/common/controllers/add_to_cart_controller.dart';
import 'package:craftybay/features/products/ui/controllers/product_details_controller.dart';
import 'package:craftybay/features/products/ui/controllers/productlist_controller.dart';
import 'package:craftybay/features/products/ui/widgets/color_picker.dart';
import 'package:craftybay/features/products/ui/widgets/increament_decrement_button.dart';
import 'package:craftybay/features/products/ui/widgets/product_image_carousel_slider.dart';
import 'package:craftybay/features/products/ui/widgets/size_picker.dart';
import 'package:craftybay/features/reviews/ui/screens/reviews_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../auth/ui/screens/sign_in_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = '/product-details';

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsController _productDetailsController =
      Get.put(ProductDetailsController());

  final AddToCartController _addToCartController = AddToCartController();

  String? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    _productDetailsController.getProductDetails(widget.productId);
    //_addToCartController.addToCart(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: GetBuilder(
          init: _productDetailsController,
          builder: (controller) {
            if (controller.inProgress) {
              return CenteredCircularProgressbar();
            }

            if (controller.errorMessage != null) {
              return Center(child: Text(controller.errorMessage!));
            }

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductImageCarouselSlider(
                          imageList: controller.product.photos,
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.product.title,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600),
                                        maxLines: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                                size: 20,
                                              ),
                                              Text(
                                                  "${controller.product.rating}"),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(context,
                                                        ReviewsScreen.name,
                                                        arguments:
                                                            widget.productId);
                                                  },
                                                  child: const Text('Review')),
                                              Card(
                                                color: AppColors.themeColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(2.0),
                                                  child: Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          //=============increase/decrese==========
                                          IncreamentDecrementButton(
                                              onChange: (int value) {
                                            print(value);
                                          }),
                                        ],
                                      ),
                                      if (controller.product.colors.isNotEmpty)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 16),

                                            ColorPicker(
                                              colors: controller.product.colors,
                                              onChange: (selectedColor) {
                                                setState(() {
                                                  _selectedColor = selectedColor;
                                                });
                                              },
                                            ),

                                          ],
                                        ),
                                      Visibility(
                                        visible:
                                            controller.product.sizes.isNotEmpty,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 16),
                                            SizePicker(
                                              sizes: controller.product.sizes,
                                              onChange: (selectedSize) {
                                                setState(() {
                                                  _selectedSize = selectedSize;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'Description',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        controller.product.description,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                      )
                                    ],
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ==============================
                _buildPriceandAddtoCartSection(
                    controller.product.sizes.isNotEmpty,
                    controller.product.colors.isNotEmpty)
              ],
            );
          }),
    );
  }

  //=========================================================
  Widget _buildPriceandAddtoCartSection(
      bool isSizeAvailable, bool isColorAvailable) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${_productDetailsController.product.currentPrice}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.themeColor),
              ),
            ],
          ),
          SizedBox(
            width: 140,
            child: GetBuilder(
                init: _addToCartController,
                builder: (controller) {
                  return Visibility(
                    visible: controller.inProgress == false,
                    replacement: const CenteredCircularProgressbar(),
                    child: ElevatedButton(
                        onPressed: () async {
                          if (isColorAvailable && _selectedColor == null) {
                            showSnackBarMessage(
                                context, 'Please select your color', true);
                            return;
                          }

                          if (isSizeAvailable && _selectedSize == null) {
                            showSnackBarMessage(
                                context, 'Please select your size', true);
                            return;
                          }



                          if (Get.find<AuthController>().isValidUser() ==
                              false) {
                            Get.to(() => const SignInScreen());
                            return;
                          }

                          final bool isSuccess = await _addToCartController
                              .addToCart(_productDetailsController.product.id);

                          if (isSuccess) {
                            showSnackBarMessage(context, 'Added to cart');
                          } else {
                            showSnackBarMessage(context,
                                _addToCartController.errorMessage!, true);
                          }
                        },
                        child: Text('Add to Cart')),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
