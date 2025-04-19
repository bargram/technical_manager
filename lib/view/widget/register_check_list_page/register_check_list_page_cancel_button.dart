import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/fonts.dart';
import '../../../model/dto/enum/register_check_list_step_type.dart';
import '../../../model/register_check_list_model.dart';
import '../../../utils/shared_strings.dart';



class RegisterCheckListPageCancelButton extends StatelessWidget {


  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(16),color: MyColors.black, fontFamily:FontsManager.vazir, fontWeight:FontWeight.bold);
  final double widgetBorderRadius = 5;
  final Color widgetColor = MyColors.lightGrey1;
  final Color widgetBorderColor = MyColors.lightBlack;
  final double widgetVerticalPadding = 0.011;
  final double widgetHorizontalPadding = 0.025;
  final Color widgetRippleColor = MyColors.grey;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return
      ClipRRect(
        borderRadius: BorderRadius.circular(widgetBorderRadius),
        child: Container(
          decoration: BoxDecoration(
              color: widgetColor,
              borderRadius: BorderRadius.circular(widgetBorderRadius),
              border: Border.all(
                color: widgetBorderColor,
              )
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: widgetRippleColor,
              highlightColor: Colors.transparent,
              onTap: (){
                if(RegisterCheckListModel().currentStep == RegisterCheckListStepType.issuanceStep){
                  Navigator.pop(context);
                }else{
                  RegisterCheckListModel.setCurrentStep(RegisterCheckListStepType.values[RegisterCheckListModel().currentStep.index-1]);
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: heightUtil(context,widgetVerticalPadding),
                    horizontal: widthUtil(context,widgetHorizontalPadding)
                ),
                child: Center(
                  child: Text(
                    RegisterCheckListModel().currentStep == RegisterCheckListStepType.issuanceStep?
                    SharedStrings.dismiss1:
                    SharedStrings.previousStep,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }
}

