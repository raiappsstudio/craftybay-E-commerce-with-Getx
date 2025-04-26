
import 'package:craftybay/core/widgets/centered_circular_progressbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../categories/model/category_model.dart';
import '../../../common/widgets/product_card.dart';
import '../controllers/productlist_controller.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});

  final CategoryModel category;

  static const String name = '/products';

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductListController _productListController = ProductListController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _productListController.getProductListByCategory(widget.category.id);
    _scrollController.addListener(_loadData);
  }

  void _loadData() {
    if (_scrollController.position.extentAfter < 300) {
      _productListController.getProductListByCategory(widget.category.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.title),
      ),
      body: GetBuilder(
          init: _productListController,
          builder: (controller) {
           /* if (controller.isInitialLoading) {
              return const CenteredCircularProgressbar();
            }*/

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: controller.isLoading == false,
                child: Column(
                  children: [
                    Container(
                      height: 500,
                      child: GridView.builder(
                        itemCount: controller.productList.length,
                        controller: _scrollController,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 0),
                        itemBuilder: (context, index) {
                          return FittedBox(
                            child: ProductCard(
                              productModel: controller.productList[index],
                            ),
                          );
                        },
                      ),
                    ),
                    Visibility(
                      visible: controller.isLoading,
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