import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import '../../../utils/colors.dart';
import '../../../utils/shared_strings.dart';





class ReturnButton extends StatelessWidget {


  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(16), color:Colors.black);

  final double widgetBorderRadius = 5;
  final double widgetVerticalPadding = 0.02;
  final double widgetHorizontalMargin = 0.05;

  final Color gradientColor1 = MyColors.deepYellow.withOpacity(0.7);
  final Color gradientColor2 = MyColors.yellowAccent.withOpacity(0.8);

  double? buttonHeight; // using for avoiding changing button size by LoadingIndicator
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: ()async{
          Navigator.pop(context);
        },
        child: Container(
          height: buttonHeight,
          padding: EdgeInsets.symmetric(
            vertical: heightUtil(context,widgetVerticalPadding),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: widthUtil(context,widgetHorizontalMargin)
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.2, 0.8],
                colors: [
                  gradientColor1,
                  gradientColor2,
                ]
            ),
            borderRadius: BorderRadius.circular(widgetBorderRadius),
          ),
          child: Center(
            child:
            Text(
              SharedStrings.returnText,
              style: textStyle,
            ),
          ),
        ),
      );
  }
}

