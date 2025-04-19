import 'package:bargram_technical_manager/controller/get_driver_controller.dart';
import 'package:bargram_technical_manager/controller/register_check_list_car_controller.dart';
import 'package:bargram_technical_manager/model/register_check_list_model.dart';
import 'package:bargram_technical_manager/utils/add_zero_to_single_digit_number.dart';
import 'package:bargram_technical_manager/utils/validation/public_validation.dart';
import 'package:bargram_technical_manager/view/widget/shared/alert.dart';
import 'package:bargram_technical_manager/view/widget/shared/three_dots_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/fonts.dart';
import '../../../controller/register_check_list_controller.dart';
import '../../../model/dto/enum/get_driver_step.dart';
import '../../../model/dto/enum/register_check_list_step_type.dart';
import '../../../utils/shared_strings.dart';
import '../shared/widget_size_detector.dart';



class RegisterCheckListPageGetDriverButton extends StatefulWidget {

  @override
  State<RegisterCheckListPageGetDriverButton> createState() => _RegisterCheckListPageGetDriverButtonState();
}

class _RegisterCheckListPageGetDriverButtonState extends State<RegisterCheckListPageGetDriverButton> {


  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle blueTextStyle = TextStyle(fontSize: ScreenUtil().setSp(16),color: MyColors.deepBlue, fontWeight:FontWeight.bold);
  final TextStyle whiteTextStyle = TextStyle(fontSize: ScreenUtil().setSp(16),color: MyColors.white, fontWeight:FontWeight.bold);
  final double widgetBorderRadius = 5;
  final Color yellowButtonColor = MyColors.yellowAccent;
  final double widgetVerticalPadding = 0.0125;
  final double widgetHorizontalPadding = 0.025;
  //////////////////////////////End Of Widget Styles////////////////////////////

  double? widgetHeight;

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<GetDriverController>(init: GetDriverController(), builder: (_) => // Initialize GetDriverController Class For RealTime Data Using GetX State Management
      GestureDetector(
      onTap: ()async{

        if(RegisterCheckListModel().cars.isNotEmpty){
          if(!PublicValidation().text(context, RegisterCheckListModel().selectedCar.toString(), SharedStrings.selectCar))return;
        }

        if(RegisterCheckListModel().cars.isNotEmpty && RegisterCheckListModel().selectedCar != null){
          RegisterCheckListModel.setCurrentStep(RegisterCheckListStepType.technicalInfo1);
          return;
        }

        if(RegisterCheckListModel().getDriverStep == GetDriverStep.smartCode){
          RegisterCheckListCarController.run(context: context, driverNationalCode:RegisterCheckListModel.driverNationalCodeController.text, driverId:RegisterCheckListModel().driverId.toString(), smartCode:RegisterCheckListModel.smartCodeController.text);
        }else{
          if(!PublicValidation().textWithLength(context, RegisterCheckListModel.driverNationalCodeController.text, SharedStrings.enterDriverNationalCode,10))return;

          if(RegisterCheckListModel().getDriverStep == GetDriverStep.mobileNumber){
            if(!PublicValidation().textWithLength(context, RegisterCheckListModel.driverMobileNumberController.text, SharedStrings.enterDriverMobileNumber,11))return;
          }
          GetDriverController.run(
              context: context,
              nationalCode:RegisterCheckListModel.driverNationalCodeController.text,
              mobileNumber:RegisterCheckListModel.driverMobileNumberController.text,
              recursive: true
          );
        }

        

      },
      child: WidgetSize(
        onChange: (Size size){
          if(widgetHeight == null){
            widgetHeight = size.height;
            setState(() {});
          }
        },
        child: Container(
          height: widgetHeight,
            padding: EdgeInsets.symmetric(
              vertical: heightUtil(context,widgetVerticalPadding),
              horizontal: heightUtil(context,widgetHorizontalPadding),
            ),
            decoration: BoxDecoration(
              color: yellowButtonColor,
              borderRadius: BorderRadius.circular(widgetBorderRadius),
            ),
            child: Center(
                child: RegisterCheckListController().loadingState?
                    Center(child:ThreeDotsLoading(color:MyColors.white),):
                Text(
                  RegisterCheckListModel().cars.isNotEmpty?
                      SharedStrings.continueText:
                  SharedStrings.issuance,
                  style: blueTextStyle,
                )
            )
        ),
      ),
      )
      );
  }
}

