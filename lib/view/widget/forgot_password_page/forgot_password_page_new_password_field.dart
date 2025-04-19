import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import '../../../model/forgot_password_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/shared_strings.dart';



class ForgotPasswordPageNewPasswordField extends StatefulWidget {
  @override
  State<ForgotPasswordPageNewPasswordField> createState() => _ForgotPasswordPageNewPasswordFieldState();
}

class _ForgotPasswordPageNewPasswordFieldState extends State<ForgotPasswordPageNewPasswordField> {

  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetHorizontalMargin = 0.025;

  final double iconHeight = 0.05;
  final double iconWidth  = 0.05;
  final double iconHorizontalMargin = 0.025;
  final double iIconVerticalMargin   = 0.01;
  final Color iconColor = MyColors.lightBlack;

  final double borderRadius = 10.0;
  final Color borderRadiusColor = const Color(0xFFBBBBBB);

  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(14),color:MyColors.lightBlack);

  final Color fillFieldColor = Colors.white;
  //////////////////////////////End Of Widget Styles////////////////////////////

  bool passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: widthUtil(context,widgetHorizontalMargin)
      ),
      child: TextField(
        controller: ForgotPasswordModel.newPasswordController,
        style: textStyle,
        textDirection: passwordVisibility ? TextDirection.rtl : TextDirection.ltr,
        obscureText: !passwordVisibility,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          counterText: '',
          floatingLabelBehavior:FloatingLabelBehavior.auto,
          labelText: SharedStrings.newPassword,
          labelStyle: textStyle,
          alignLabelWithHint: false,
          isDense: true,
          prefixIcon: Container(
              height:heightUtil(context,iconHeight),
              width: widthUtil(context,iconWidth),
              margin: EdgeInsets.symmetric(horizontal:widthUtil(context,iconHorizontalMargin), vertical:heightUtil(context,iIconVerticalMargin)),
              child: FittedBox(
                child: Icon(Icons.lock, color:iconColor,),
              )
          ),
          prefixIconConstraints: BoxConstraints(minWidth:widthUtil(context,iconWidth), minHeight: heightUtil(context,iconHeight)),
          suffixIcon: GestureDetector(
            onTap: (){
              passwordVisibility = !passwordVisibility;
              setState(() {});
            },
            child: Container(
                height:heightUtil(context,iconHeight),
                width: widthUtil(context,iconWidth),
                margin: EdgeInsets.symmetric(horizontal:widthUtil(context,iconHorizontalMargin), vertical:heightUtil(context,iIconVerticalMargin)),
                child: FittedBox(
                  child: Icon(passwordVisibility ? Icons.visibility :Icons.visibility_off, color:iconColor,),
                )
            ),
          ),
          suffixIconConstraints: BoxConstraints(minWidth:widthUtil(context,iconWidth), minHeight: heightUtil(context,iconHeight)),
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
