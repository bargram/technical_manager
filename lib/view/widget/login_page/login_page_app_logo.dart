
import 'package:flutter/material.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';

import '../../../utils/assets_paths.dart';

class LoginPageAppLogo extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetWidth = 0.5;
  final double widgetBorderRadius = 20;
  //////////////////////////////End Of Widget Styles////////////////////////////


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widgetBorderRadius)
      ),
      height: widthUtil(context,widgetWidth),
        width: widthUtil(context,widgetWidth),
        child: Image.asset(AssetPaths.appLogo)
    );
  }
}
