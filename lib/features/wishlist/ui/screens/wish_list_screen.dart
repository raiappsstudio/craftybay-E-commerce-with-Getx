import 'package:craftybay/core/widgets/centered_circular_progressbar.dart';
import 'package:craftybay/features/wishlist/ui/controllers/wish_list_controller.dart';
import 'package:craftybay/features/wishlist/ui/widgets/wish_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({
    super.key,
  });

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishListController _wishListController = WishListController();

  @override
  void initState() {
    super.initState();
    _wishListController.getWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wish List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<WishListController>(builder: (controller) {
          if (controller.wishlistProgress) {
            return CenteredCircularProgressbar();
          }

          return Visibility(
            visible: !controller.wishlistProgress,
            replacement: CenteredCircularProgressbar(),
            child: GridView.builder(
              itemCount: controller.wishlist.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                return WishCard(
                  wishlistModel: controller.wishlist[index],
                );
              },
            ),
          );
        }),
      ),

    );
  }
}
