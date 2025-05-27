import 'package:craftybay/core/widgets/centered_circular_progressbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import '../../../../app/app_colors.dart';
import '../../../common/controllers/main_bottom_nav_bar_controller.dart';
import '../../models/cart_item_model.dart';
import '../controller/cart_list_controller.dart';
import '../widgets/cartlist_item.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  final CartListController _cartListController = Get.find<CartListController>();
  @override
  void initState() {
    super.initState();
    _cartListController.getCartList();
    print(" this is cart item number: ${_cartListController.cartItemList}");
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text('Cart list'),
        ),
        body: GetBuilder<CartListController>(builder: (controller) {
          if (controller.getCartListInProgress) {
            return const CenteredCircularProgressbar();
          }

          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: controller.cartItemList.length,
                    itemBuilder: (context, index) {
                      CartItemModel cartItem = controller.cartItemList[index];
                      return CartItemCard(cartItem: cartItem);
                    },
                  ),
                ),
              ),
              Container(
                child: _buildTotalPriceSection(),
              )
            ],
          );
        }),
      ),
    );
  }

  Widget _buildTotalPriceSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text('Total Price'),
              Text(
                '\$${_cartListController.totalPrice}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.themeColor),
              ),
            ],
          ),
          SizedBox(
            width: 140,
            child: ElevatedButton(
              onPressed: () async {
                /*Navigator.pushNamed(
                  context,
                  PaymentScreen.name,
                  arguments: _cartListController.totalPrice.toDouble(),
                );*/
                await paymentGetwayIntrigration(_cartListController.totalPrice.toDouble());
              },
              child: const Text('Checkout'),
            ),
          )
        ],
      ),
    );
  }

  Future<void> paymentGetwayIntrigration(double totalPrice) async {
    Sslcommerz sslcommerz = Sslcommerz(
        initializer: SSLCommerzInitialization(
          //   ipn_url: "www.ipnurl.com",
            multi_card_name: "visa,master,bkash",
            currency: SSLCurrencyType.BDT,
            product_category: "Food",
            sdkType: SSLCSdkType.TESTBOX,
            store_id: "topwa6835dec9a414d",
            store_passwd: "topwa6835dec9a414d@ssl",
            total_amount: totalPrice,
            tran_id: "custom_transaction_idxxxteeeesssxxxxxx"));

    final response = await sslcommerz.payNow();

    if (response.status == 'VALID') {
      print('Payment successfully');
    } else if (response.status == 'Closed') {
      print('Payment closed');
    } else if (response.status == 'FAILED') {
      print('Payment Failed');
    }


  }

}