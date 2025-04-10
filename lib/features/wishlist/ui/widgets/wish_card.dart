import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';


class WishCard extends StatelessWidget {
  const WishCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        width: 140,
        child: Column(
          children: [
            Container(
              height: 120,
              width: 140,
              decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: const DecorationImage(
                      image: AssetImage(AssetsPathe.shoesImage),
                      fit: BoxFit.scaleDown)),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'Nike Nk 76 - new Collection',
                    maxLines: 1,
                    style: TextStyle(overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w600),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('\$ 45',
                        style: TextStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w600),),

                      const Wrap(children: [
                        Icon(Icons.star,size: 18, color: Colors.orange,),
                        Text('4.6')
                      ],),

                      Card(
                        color: AppColors.themeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(Icons.delete,size: 14,color: Colors.white,),
                        ),
                      )



                    ],
                  )


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
