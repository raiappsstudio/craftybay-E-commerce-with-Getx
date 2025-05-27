import 'package:craftybay/core/widgets/centered_circular_progressbar.dart';
import 'package:craftybay/features/wishlist/ui/controllers/wish_list_controller.dart';
import 'package:craftybay/features/wishlist/ui/widgets/wish_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  static const String name = '/wish-list';

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishListController _wishListController = Get.put(WishListController());

  @override
  void initState() {
    super.initState();
    _wishListController.getWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wish List'),
      ),
      body: GetBuilder(
          init: _wishListController,
          builder: (controller) {
            if (controller.wishlistProgress) {
              return const CenteredCircularProgressbar();
            }

            if (controller.errorMessage != null) {
              return Center(child: Text(controller.errorMessage!));
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: controller.wishlistProgress == false,
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        itemCount: controller.wishlist.length,
                        // <-- use controller, not new instance
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 0,
                        ),
                        itemBuilder: (context, index) {
                          return FittedBox(
                            child: WishCard(
                                wishlistModel: controller.wishlist[index]),
                          );
                        },
                      ),
                    ),
                    Visibility(
                      visible: controller.wishlistProgress,
                      child: const LinearProgressIndicator(),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
