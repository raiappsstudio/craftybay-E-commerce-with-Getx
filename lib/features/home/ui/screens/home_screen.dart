import 'package:craftybay/app/assets_path.dart';
import 'package:craftybay/core/extensions/localization_extension.dart';
import 'package:craftybay/core/widgets/centered_circular_progressbar.dart';
import 'package:craftybay/features/categories/controller/category_controller.dart';
import 'package:craftybay/features/categories/model/category_model.dart';
import 'package:craftybay/features/common/controllers/main_bottom_nav_bar_controller.dart';
import 'package:craftybay/features/products/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../widgets/app_bar_action_button.dart';
import '../../../common/widgets/category_item.dart';
import '../../widgets/home_carousel_slider.dart';
import '../../../common/widgets/product_card.dart';
import '../../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _saerchTextField(),
              const SizedBox(height: 16),
              HomeCarouselSlider(),
              const SizedBox(height: 16),
              SectionHeader(
                title: context.localization.categorys,
                onTapSeeAll: () {
                  Get.find<MainBottomNavBarController>().moveToCategory();
                },
              ),
              _buildCategorySection(),
              const SizedBox(height: 16),
              SectionHeader(
                title: context.localization.popular,
                onTapSeeAll: () {
                  Navigator.pushNamed(context, ProductListScreen.name);
                },
              ),
              _buildProductSection(),
              const SizedBox(height: 16),
              SectionHeader(
                title: context.localization.special,
                onTapSeeAll: () {},
              ),
              _buildProductSection(),
              const SizedBox(height: 16),
              SectionHeader(
                title: context.localization.snew,
                onTapSeeAll: () {},
              ),
              _buildProductSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductSection() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: const Row(
        children: [
         /* ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),*/
        ],
      ),
    );
  }

  Widget _buildCategorySection() {
    return GetBuilder<CategoryController>(builder: (controller) {
      if (controller.isInitialLoading) {
        return const SizedBox(
          height: 100,
          child: CenteredCircularProgressbar(),
        );
      }

      List<CategoryModel> list = controller.categoryList.length > 10
          ? controller.categoryList.sublist(0, 10)
          : controller.categoryList;

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: list.map(
            (e) {
              return CategoryItems(categoryModel: e);
            },
          ).toList(),
        ),
      );
    });
  }

  Widget _saerchTextField() {
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        fillColor: Colors.grey.withOpacity(0.2),
        filled: true,
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPathe.logoNavSvg),
      actions: [
        appbarActionButton(
          icon: Icons.person_outline,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        appbarActionButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        appbarActionButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
