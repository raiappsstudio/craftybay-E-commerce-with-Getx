import 'package:flutter/material.dart';

class CenteredCircularProgressbar extends StatelessWidget {
  const CenteredCircularProgressbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
