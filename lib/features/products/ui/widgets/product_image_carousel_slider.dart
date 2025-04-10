import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarouselSlider extends StatefulWidget {
   ProductImageCarouselSlider({
    super.key,
  });

  @override
  State<ProductImageCarouselSlider> createState() => _ProductImageCarouselSliderState();
}

class _ProductImageCarouselSliderState extends State<ProductImageCarouselSlider> {
  int _selectedSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        CarouselSlider(
          options: CarouselOptions(
              height: 220.0,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                _selectedSlider = index;
                setState(() {});
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                        color: Colors.greenAccent,
                    child: Center(
                        child: Text(
                      'Image $i',
                      style: TextStyle(fontSize: 16.0),
                    )));
              },
            );
          }).toList(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                Container(
                  height: 20,
                  width: 20,
                  margin: EdgeInsets.only(left: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                    color: _selectedSlider == i
                        ? AppColors.themeColor
                        : Colors.white,
                  ),
                )
            ],
          ),
        ),

      ],
    );
  }
}
