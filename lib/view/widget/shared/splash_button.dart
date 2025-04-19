import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../utils/fonts.dart';
import '../../../utils/size_utils.dart';



class SplashButton extends StatelessWidget {

  //Constructor
  Function onTap;
  String text;
  SplashButton({required this.onTap, required this.text});
  ////////////


  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(16),color: MyColors.black, fontFamily:FontsManager.vazir, fontWeight:FontWeight.bold);
  final double widgetBorderRadius = 5;
  final Color widgetColor = MyColors.lightGrey1;
  final double widgetVerticalPadding = 0.0225;
  final double widgetHorizontalPadding = 0.075;
  final Color widgetRippleColor = MyColors.grey;
  //////////////////////////////End Of Widget Styles////////////////////////////
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widgetBorderRadius),
      child: Container(
        decoration: BoxDecoration(
            color: widgetColor,
            borderRadius: BorderRadius.circular(widgetBorderRadius),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: widgetRippleColor,
            highlightColor: Colors.transparent,
            onTap: (){
              if(onTap != null )onTap!();
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: heightUtil(context,widgetVerticalPadding),
                  horizontal: widthUtil(context,widgetHorizontalPadding)
              ),
              child: DefaultTextStyle(
                style: textStyle,
                child: Center(
                  child: Text(
                    text,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
