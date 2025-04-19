import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/assets_paths.dart';
import '../../../utils/colors.dart';
import '../../../utils/shared_strings.dart';




class RegisteredCheckListPageTopBar extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetWidth = 1;

  final double iconPadding = 0.02;
  final double iconWidth = 0.05;
  final double iconBorderRadius = 5;
  final Color iconBorderColor = MyColors.black;
  final Color iconColor = MyColors.black;

  final double widgetVerticalPadding = 0.015;
  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(16), color:MyColors.deepBlue, fontWeight:FontWeight.bold);

  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthUtil(context,widgetWidth),
      padding: EdgeInsets.symmetric(
          vertical: heightUtil(context,widgetVerticalPadding),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(widthUtil(context, iconPadding)),
              decoration: BoxDecoration(
                border: Border.all(color:iconBorderColor),
                borderRadius: BorderRadius.circular(iconBorderRadius),
              ),
              // width: widthUtil(context,widgetWidth),
              child: Center(
                child: SizedBox(
                  height: widthUtil(context,iconWidth),
                  width: widthUtil(context,iconWidth),
                  child: SvgPicture.asset(AssetPaths.arrowBackIcon,),
                ),
              ),
            ),
          ),
          SizedBox(width:widthUtil(context,0.05),),
          Expanded(
            child: Text(
              SharedStrings.technicalChecklist,
              style: textStyle,
            ),
          )
        ],
      ),
    );
  }
}
