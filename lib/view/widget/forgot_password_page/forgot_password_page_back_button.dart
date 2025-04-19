import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import '../../../model/forgot_password_model.dart';
import '../../../utils/colors.dart';




class ForgotPasswordPageBackButton extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final double iconSize = 40;
  final Color iconColor = MyColors.lightBlack;
  final double widgetVerticalPadding = 0.01;
  final double widgetHorizontalPadding = 0.025;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            ForgotPasswordModel.resetCodePartsAndPassword(); // clear text fields
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: heightUtil(context,widgetVerticalPadding),
                horizontal: widthUtil(context,widgetHorizontalPadding)
            ),
            child: Icon(Icons.arrow_back_rounded, color: iconColor, size:ScreenUtil().setSp(iconSize),),
          ),
        ),
      ],
    );
  }
}
