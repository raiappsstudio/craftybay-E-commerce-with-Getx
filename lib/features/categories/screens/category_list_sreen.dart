import 'package:craftybay/core/widgets/centered_circular_progressbar.dart';
import 'package:craftybay/features/categories/controller/category_controller.dart';
import 'package:craftybay/features/common/widgets/category_item.dart';
import 'package:craftybay/features/products/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common/controllers/main_bottom_nav_bar_controller.dart';

class CategoryListSreen extends StatefulWidget {
  const CategoryListSreen({super.key});

  static const String name = '/categoris';

  @override
  State<CategoryListSreen> createState() => _CategoryListSreenState();
}

class _CategoryListSreenState extends State<CategoryListSreen> {
  final CategoryController _categoryController = Get.find<CategoryController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _categoryController.getCategoryList();
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _categoryController.getCategoryList();
    }
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
          leading: GestureDetector(
              onTap: () {
               Get.find<MainBottomNavBarController>().backToHome();
                //Navigator.pushNamed(context, ProductListScreen.name);
              },
              child: const Icon(Icons.arrow_back_ios)),
          title: const Text('Categories'),
        ),
        body: GetBuilder<CategoryController>(builder: (controller) {
          if (controller.isInitialLoading) {
            return const CenteredCircularProgressbar();
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Visibility(
              visible: controller.isInitialLoading == false,
              child: Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: ()async{
                        controller.refreshList();
                      },
                      child: GridView.builder(
                          itemCount: controller.categoryList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 16,
                          ),
                          itemBuilder: (context, index) {
                            return  FittedBox(child: CategoryItems(
                              categoryModel: controller.categoryList[index],
                            ));
                          }),
                    ),
                  ),
                  Visibility(
                      visible: controller.isLoading,
                      child: const LinearProgressIndicator())
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
