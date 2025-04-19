import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../model/dto/enum/register_check_list_step_status.dart';
import '../../../model/dto/enum/register_check_list_step_type.dart';
import '../../../model/dto/register_check_list_step.dart';
import '../../../model/register_check_list_model.dart';
import '../../../utils/assets_paths.dart';
import '../../../utils/colors.dart';
import '../../../utils/shared_strings.dart';
import '../../../utils/size_utils.dart';



class RegisterCheckListPageStepIndicator extends StatelessWidget {


  //////////////////////////////Widget Styles///////////////////////////////////
  final double indicatorsHorizontalMargin = 0.0;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.symmetric(
            horizontal: widthUtil(context, indicatorsHorizontalMargin)
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              _Indicator(
                step: RegisterCheckListStep(
                    title: SharedStrings.technicalInfo,
                    type: RegisterCheckListStepType.technicalInfo1,
                    status:
                    RegisterCheckListStepType.technicalInfo8.index > RegisterCheckListModel().currentStep.index?
                    RegisterCheckListStepStatus.filling:
                    RegisterCheckListStepType.technicalInfo8.index < RegisterCheckListModel().currentStep.index?
                    RegisterCheckListStepStatus.filled:
                    RegisterCheckListStepStatus.empty,
                    iconPath: AssetPaths.checkListIcon
                ),
              ),
              
              Expanded(child:_StepLineIndicator()),

              _Indicator(
                step: RegisterCheckListStep(
                    title: SharedStrings.signature,
                    type: RegisterCheckListStepType.signature,
                    status:
                    RegisterCheckListStepType.signature == RegisterCheckListModel().currentStep?
                    RegisterCheckListStepStatus.filling:
                    RegisterCheckListStepType.signature.index < RegisterCheckListModel().currentStep.index?
                    RegisterCheckListStepStatus.filled:
                    RegisterCheckListStepStatus.empty,
                    iconPath: AssetPaths.editIconSvg
                ),
              ),

              // Expanded(child:Container(height: 1, color:MyColors.lightBlack,)),
              //
              // _Indicator(
              //   step: RegisterCheckListStep(
              //       title: SharedStrings.finalApprove,
              //       type: RegisterCheckListStepType.finalApprove,
              //       status:
              //       RegisterCheckListStepType.finalApprove == RegisterCheckListModel().currentStep?
              //       RegisterCheckListStepStatus.filling:
              //       RegisterCheckListStepType.finalApprove.index < RegisterCheckListModel().currentStep.index?
              //       RegisterCheckListStepStatus.filled:
              //       RegisterCheckListStepStatus.empty,
              //       iconPath: AssetPaths.tickIconSvg
              //   ),
              // ),

            ]
        ),
      );
  }
}



class _Indicator extends StatelessWidget {

  //Constructor
  RegisterCheckListStep step;
  _Indicator({required this.step});
  //////////////

  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetPadding = 0.0175;
  final double widgetBorderRadius = 12.5;
  final TextStyle smallTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.deepBlue);
  final TextStyle largeTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.deepBlue, fontWeight:FontWeight.bold);
  final Color filledBoxColor = MyColors.deepGreen;
  final Color fillingBoxColor = MyColors.lightBlue2;
  final Color emptyBoxColor = MyColors.lightGrey1.withOpacity(0.5);
  final Color fillingIconColor = MyColors.black;
  final Color emptyIconColor = MyColors.black;
  final double iconWidth = 0.07;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        // RegisterCheckListModel.setCurrentStep(step.type);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: widthUtil(context, widgetPadding),
              vertical: widthUtil(context, widgetPadding),
            ),
            decoration: BoxDecoration(
              color:
              step.status ==  RegisterCheckListStepStatus.filled? filledBoxColor:
              step.status ==  RegisterCheckListStepStatus.filling? fillingBoxColor:
              emptyBoxColor,
              borderRadius: BorderRadius.circular(widgetBorderRadius)
            ),
            child: SizedBox(
                height: widthUtil(context,iconWidth),
                width: widthUtil(context,iconWidth),
                child: SvgPicture.asset(
                  step.iconPath,
                  color: step.status == RegisterCheckListStepStatus.empty ? // means this page is selected
                  emptyIconColor : fillingIconColor,
                )
            ),
          ),
          SizedBox(height:heightUtil(context, 0.01),),
          Text(
            RegisterCheckListModel().currentStep.index < 10?
            '${SharedStrings.step} ${step.type.index+1}':'',
            style:smallTextStyle,
            textAlign:TextAlign.center,
          ),
          SizedBox(height:heightUtil(context, 0.01),),
          Text(
            step.title,
            style:largeTextStyle,
            textAlign:TextAlign.center,
          ),
        ],
      ),
    );
  }
}



class _StepLineIndicator extends StatelessWidget {
  double height = 1;
  double width = 1;
  Color enableColor = MyColors.deepGreen;
  Color disableColor = MyColors.grey;
  int number = 9;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Flex(
          children: List.generate(number, (index) {
            return SizedBox(
              width: widthUtil(context, 0.02),
              height: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(color:
                index <= RegisterCheckListModel().currentStep.index?
                    enableColor:disableColor
                ),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
