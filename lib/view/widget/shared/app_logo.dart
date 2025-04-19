import 'package:flutter/material.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import '../../../utils/assets_paths.dart';




class AppLogo extends StatelessWidget {

  final double height;
  final double width;

  //Constructor
  AppLogo({required this.height, required this.width});
  /////////////

  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetBorderRadius = 20;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widgetBorderRadius)
      ),
      height: widthUtil(context,height),
        width: widthUtil(context,width),
        child: Image.asset(AssetPaths.appLogo)
    );
  }
}
