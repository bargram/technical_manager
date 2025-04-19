import 'package:bargram_technical_manager/utils/shared_strings.dart';
import 'package:bargram_technical_manager/view/widget/shared/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/model/confirm_sms_code_model.dart';
import '../../../utils/colors.dart';



class ConfirmLoginSMSCodePageHint extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(14),color:MyColors.lightBlack);

  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return ResponsiveText(
      '${SharedStrings.confirmCodeDriverHintPart1} ${ConfirmLoginSMSCodeModel().phoneNumber} ${SharedStrings.confirmCodeDriverHintPart2}',
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }
}
