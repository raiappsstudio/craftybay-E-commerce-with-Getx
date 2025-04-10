import 'package:craftybay/app/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.size, required this.onChange});

  final List<String> size;
  final Function(String) onChange;


  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {

  String? selectedSize;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Size',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
        const SizedBox(height: 8),
        SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: widget.size.length,
              itemBuilder: (context, index){
              String color =widget.size[index];
                return GestureDetector(
                  onTap: (){
                    selectedSize = color;
                    setState(() {});
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: selectedSize == color ? AppColors.themeColor: null,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.only(right: 8),
                    alignment: Alignment.center,
                    child: Text(color, style: TextStyle(
                      color: selectedSize == color ? Colors.white : null,
                    ),),
                  ),
                );

          }),
        )

      ],
    );
  }
}
