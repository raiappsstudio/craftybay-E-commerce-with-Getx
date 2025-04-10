import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/features/products/ui/widgets/color_picker.dart';
import 'package:craftybay/features/products/ui/widgets/increament_decrement_button.dart';
import 'package:craftybay/features/products/ui/widgets/product_image_carousel_slider.dart';
import 'package:craftybay/features/products/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCarouselSlider(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [



                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Happy New Year Special Deal Save 30%",
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                                  maxLines: 2,
                                ),



                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.orange,size: 20,
                                        ),
                                        Text('4.8'),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text('Review')),

                                        Card(
                                          color: AppColors.themeColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4),
                                          ),

                                          child: const Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: Icon(Icons.favorite_border,color: Colors.white,),
                                          ),

                                        ),
                                      ],
                                    ),

                                    //=============increase/decrese==========
                                    IncreamentDecrementButton(onChange: (int value) {
                                      print(value);
                                    }),

                                  ],
                                ),

                                const SizedBox(height: 16),
                                ColorPicker(colors: ['Red','Blue','White', 'Black', 'Pink'], onChange: (selectedColor){
                                  print(selectedColor);
                                }),
                                const SizedBox(height: 16),
                                SizePicker(size: ['X','XL','L', 'M', 'S'], onChange: (selectedColor){
                                  print(selectedColor);
                                }),
                                const SizedBox(height: 16),
                                Text('Description',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                                const SizedBox(height: 8),
                                Text('''Bangladesh, to the east of India on the Bay of Bengal,Bangladesh, to the east of India on the Bay of Bengal, is a South Asian country marked by lush greenery and many waterways. Its Padma (Ganges), Meghna and Jamuna rivers create fertile plains, and travel by boat is common. On the southern coast, the Sundarbans, an enormous mangrove forest shared with Eastern India, is home to the royal Bengal tig is a South Asian country marked by lush greenery and many waterways. Its Padma (Ganges), Meghna and Jamuna rivers create fertile plains, and travel by boat is common. On the southern coast, the Sundarbans, an enormous mangrove forest shared with Eastern India, is home to the royal Bengal tig''',style: TextStyle(color: Colors.black.withOpacity(0.5)),)
                              ],
                            )),

                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ==============================
          _buildPriceandAddtoCartSection()



          
        ],
      ),

    );
  }



  //=========================================================
  Widget _buildPriceandAddtoCartSection() {
    return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Text(
                    '\$1000',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: AppColors.themeColor),
                  ),
                ],
              ),
              SizedBox(
                width: 140,
                child: ElevatedButton(
                    onPressed: () {}, child: Text('Add to Cart')),
              ),
            ],
          ),
        );
  }
}
