import 'package:craftybay/features/auth/ui/widgets/category_item.dart';
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
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Get.find<MainBottomNavBarController>().backToHome();
            },
              child: Icon(Icons.arrow_back_ios)),
          title: const Text('Categories'),
        ),
        body: GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return const FittedBox(child: CategoryItems());
            }),
      ),
    );
  }
}
