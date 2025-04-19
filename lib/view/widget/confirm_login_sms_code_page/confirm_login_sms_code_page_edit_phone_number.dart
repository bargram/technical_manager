import 'package:bargram_technical_manager/utils/colors.dart';
import 'package:bargram_technical_manager/utils/shared_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/model/confirm_sms_code_model.dart';

class ConfirmLoginSMSCodePageEditPhoneNumber extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(14),color: MyColors.deepBlue, fontWeight:FontWeight.bold);
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        ConfirmLoginSMSCodeModel.resetCodePartsAndPassword(); // clear text fields
        Navigator.pop(context);
      },
      child: Text(
        SharedStrings.editPhoneNumber,
        style: textStyle,
      ),
    );
  }
}
