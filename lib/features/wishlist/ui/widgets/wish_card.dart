import 'package:craftybay/core/widgets/centered_circular_progressbar.dart';
import 'package:craftybay/features/products/ui/controllers/product_details_controller.dart';
import 'package:craftybay/features/products/ui/screens/product_details_screen.dart';
import 'package:craftybay/features/wishlist/models/wishlist_model.dart';
import 'package:craftybay/features/wishlist/ui/controllers/wish_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';

class WishCard extends StatelessWidget {
  WishCard({
    super.key,
    required this.wishlistModel,
  });

  final WishlistModel wishlistModel;

  WishListController _wishListController = WishListController();
  ProductDetailsController _productDetailsController = ProductDetailsController();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        width: 180,
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, ProductDetailsScreen.name,arguments: wishlistModel.productModel.id);
              },
              child: Container(
                height: 120,
                width: 180,
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/shoes_pic.jpg', // your local asset
                    image: wishlistModel.productModel.photos.first,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    wishlistModel.productModel.title,
                    maxLines: 1,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${wishlistModel.productModel.currentPrice}',
                        style: const TextStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Wrap(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 18,
                            color: Colors.orange,
                          ),
                          Text("${wishlistModel.productModel.rating}")
                        ],
                      ),
                      GetBuilder<WishListController>(
                        builder: (controller) {
                          return Visibility(
                            visible: controller.deleteInprogress == false,
                            replacement: CenteredCircularProgressbar(),
                            child: Card(
                              color: AppColors.themeColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: InkWell(
                                    onTap: (){
                                      controller.deleteInprogress == true;
                                      _wishListController
                                          .deleteWishItem(wishlistModel.id);
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      size: 18,
                                      color: Colors.red,
                                    )),
                              ),
                            ),
                          );
                        }
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
