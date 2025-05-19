import 'package:craftybay/app/app_colors.dart';
import 'package:flutter/material.dart';

class IncreamentDecrementButton extends StatefulWidget {
  const IncreamentDecrementButton({super.key, required this.onChange});

final Function(int) onChange;

  @override
  State<IncreamentDecrementButton> createState() => _IncreamentDecrementButtonState();
}

class _IncreamentDecrementButtonState extends State<IncreamentDecrementButton> {

  int count = 1;


  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 6,
      children: [
        GestureDetector(
          onTap: () {
            if (count <= 1)return;
            count--;
            widget.onChange(count);
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          "$count",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            if (count >= 20)return;
            count++;
            widget.onChange(count);
            setState(() {});

          },
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
