
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {

  //Constructor
  double? height;
  double? width;
  double? borderRadius;
  Color color;
  CustomDivider({required this.height, required this.width, required this.color, this.borderRadius});
  ////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        color: color,
      ),
      height: height,
      width: width,
    );
  }
}
