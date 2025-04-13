
import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';
import '../../../products/ui/widgets/increament_decrement_button.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
              height: 100,
              child: Image(image: AssetImage(AssetsPathe.shoesImage))),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Year Special shoes",
                style: TextStyle(fontSize: 20),
                maxLines: 20,
              ),
              Text(
                "Color: Red, Size: xl",
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "\$1000",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.delete)),
              IncreamentDecrementButton(onChange: (int value) {
                print(value);
              })
            ],
          )
        ],
      ),
    );
  }
}
