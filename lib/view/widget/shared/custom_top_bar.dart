import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import '../../../utils/colors.dart';



class CustomTopBar extends StatelessWidget {

  //Constructor
  String label;
  CustomTopBar(this.label);
  ////////////

  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetWidth = 1;

  final double iconHeight = 0.05;
  final double iconWidth = 0.1;
  final Color iconColor = MyColors.lightBlack;

  final double widgetVerticalPadding = 0.01;
  final double widgetHorizontalPadding = 0.025;
  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(16), color:MyColors.lightBlack);

  final Color backgroundColor = const Color(0xFFFFFFFF);
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthUtil(context,widgetWidth),
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
          vertical: heightUtil(context,widgetVerticalPadding),
          horizontal: widthUtil(context,widgetHorizontalPadding)
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap:()=> Navigator.pop(context),
            child: SizedBox(
              height: heightUtil(context,iconHeight),
              width: widthUtil(context,iconWidth),
              child: FittedBox(child: Icon(Icons.arrow_back_rounded, color: iconColor,)),
            ),
          ),
          SizedBox(width:widthUtil(context,0.05),),
          Expanded(
            child: Text(
              label,
              style: textStyle,
            ),
          )
        ],
      ),
    );
  }
}
