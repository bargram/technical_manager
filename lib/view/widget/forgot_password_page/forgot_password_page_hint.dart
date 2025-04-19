import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import '../../../model/forgot_password_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/shared_strings.dart';



class ForgotPasswordPageHint extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(14),color: MyColors.lightBlack);

  final double widgetHorizontalMargin = 0.025;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: widthUtil(context,widgetHorizontalMargin)
      ),
      child: Column(
        children: [
          Text(
            SharedStrings.confirmForgotPasswordHint,
            style: textStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            ForgotPasswordModel().phoneNumber.toString(),
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
