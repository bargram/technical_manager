import 'package:bargram_technical_manager/view/page/login_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';

import '../../../utils/shared_strings.dart';


class LoginPageOtpText extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetHorizontalMargin = 0.025;
  final TextStyle blueTextStyle = TextStyle(color: const Color(0xFF00A3FF), fontSize: ScreenUtil().setSp(14), fontWeight: FontWeight.bold);
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: widthUtil(context, widgetHorizontalMargin)
      ),
      child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: Text(
                  SharedStrings.loginWithOtp,
                  textAlign: TextAlign.center,
                  style: blueTextStyle
                ),
              ),
            ],
          ),
        ),
    );
  }
}
