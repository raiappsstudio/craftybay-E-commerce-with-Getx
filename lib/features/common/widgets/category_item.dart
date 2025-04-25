import 'package:craftybay/features/categories/model/category_model.dart';
import 'package:craftybay/features/products/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../app/app_colors.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key, required this.categoryModel,
  });


  final CategoryModel categoryModel;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(
          context,
          ProductListScreen.name,
          arguments: categoryModel,
        );      },
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: AppColors.themeColor.withOpacity(0.15),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Image.network(categoryModel.icon, width: 48, height: 48,color: AppColors.themeColor,),
            ),
          ),

           Text(
            categoryModel.title,
            style: const TextStyle(
                color: AppColors.themeColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          )
        ],
      ),
    );
  }


  Future<void> _getCategory () async{




  }




}
