import 'package:craftybay/features/products/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../app/app_colors.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListScreen.name, arguments:"Electonics" );
      },
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 8),
            color: AppColors.themeColor.withOpacity(0.15),
            elevation: 0,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.computer,
                  size: 48, color: AppColors.themeColor),
            ),
          ),

          const Text(
            'Computers',
            style: TextStyle(
                color: AppColors.themeColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          )
        ],
      ),
    );
  }
}
