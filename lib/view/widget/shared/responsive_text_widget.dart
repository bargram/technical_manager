
import 'package:flutter/material.dart';

//Responsive Text without any library that useful in some cases
class ResponsiveText extends StatelessWidget {
  String text;
  TextStyle style;
  TextAlign textAlign;
  double? height;
  double? width;

  ResponsiveText(this.text,{required this.style, required this.textAlign, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FittedBox(
        child: Text(text,style: style,textAlign: textAlign,),
      ),
    );
  }

}
