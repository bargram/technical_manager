import 'package:bargram_technical_manager/utils/shared_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/model/login_model.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import '../../../utils/assets_paths.dart';
import '../../../utils/colors.dart';




class LoginPagePhoneNumberField extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetHorizontalMargin = 0.025;

  final double prefixIconHeight = 0.05;
  final double prefixIconWidth  = 0.05;
  final double prefixIconHorizontalMargin = 0.025;
  final double prefixIconVerticalMargin   = 0.01;
  final Color prefixIconColor = MyColors.lightBlack;

  final double borderRadius = 10.0;
  final Color borderRadiusColor = const Color(0xFFBBBBBB);

  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.lightBlack);

  final Color fillFieldColor = Colors.white;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: widthUtil(context,widgetHorizontalMargin)
      ),
      child: TextField(
        controller: LoginModel.mobileNumberController,
        keyboardType: TextInputType.number,
        maxLength: 11,
        decoration: InputDecoration(
          counterText: '',
          floatingLabelBehavior:FloatingLabelBehavior.auto,
          labelText: SharedStrings.phoneNumber,
          labelStyle: textStyle,
          alignLabelWithHint: false,
          isDense: true,
          prefixIcon: Container(
            margin: EdgeInsets.symmetric(horizontal:widthUtil(context,prefixIconHorizontalMargin), vertical:heightUtil(context,prefixIconVerticalMargin)),
            child: Image.asset(AssetPaths.phoneIcon, height:heightUtil(context,prefixIconHeight), width: widthUtil(context,prefixIconWidth), color:prefixIconColor,),
          ),
          prefixIconConstraints: BoxConstraints(minWidth:widthUtil(context,prefixIconWidth), minHeight: heightUtil(context,prefixIconHeight)),
          fillColor: fillFieldColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color:borderRadiusColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderRadiusColor),
          ),
        ),
      ),
    );
  }
}
