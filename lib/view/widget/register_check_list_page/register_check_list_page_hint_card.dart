import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import '../../../model/dto/enum/register_check_list_step_type.dart';
import '../../../model/register_check_list_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/shared_strings.dart';




class RegisterCheckListPageHintCard extends StatelessWidget {




  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetWidth = 1;

  final double widgetVerticalPadding = 0.01;
  final TextStyle blueTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.deepBlue, fontWeight:FontWeight.bold);

  final Color widgetColor = MyColors.veryLightBlue;
  final Color widgetBorderColor = MyColors.lightBlue1.withOpacity(0.5);
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: widgetBorderColor,
      dashPattern: const [6, 3],
      strokeWidth: 1,
      child: Container(
        width: widthUtil(context,widgetWidth),
        color: widgetColor,
        padding: EdgeInsets.symmetric(
          horizontal: heightUtil(context,widgetVerticalPadding),
          vertical: heightUtil(context,widgetVerticalPadding),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                RegisterCheckListModel().currentStep == RegisterCheckListStepType.signature || RegisterCheckListModel().currentStep == RegisterCheckListStepType.technicalInfo9?
                SharedStrings.driverDiagnosisDetail: SharedStrings.pleaseAnswerQuestions,
                style: blueTextStyle,
                textAlign:TextAlign.center,
              ),
            ),
          ],
        )
      ),
    );
  }
}
