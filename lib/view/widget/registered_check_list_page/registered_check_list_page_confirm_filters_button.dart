import 'package:bargram_technical_manager/model/dto/filter_type.dart';
import 'package:bargram_technical_manager/utils/string_is_empty.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../utils/colors.dart';
import '../../../controller/get_all_registered_check_list_controller.dart';
import '../../../model/register_check_list_model.dart';
import '../../../model/registered_check_list_model.dart';
import '../../../utils/assets_paths.dart';
import '../../../utils/fonts.dart';
import '../../../utils/shared_strings.dart';
import '../../../utils/size_utils.dart';


class RegisteredCheckListPageConfirmFiltersButton extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.deepBlue, fontWeight:FontWeight.bold);

  final double widgetBorderRadius = 5;
  final Color widgetColor = MyColors.yellowAccent;
  final double widgetVerticalPadding = 0.02;
  final double widgetHorizontalPadding = 0.02;
  final double widgetHorizontalMargin = 0.01;

  final Color indicatorColor = Colors.black;
  final Color gradientColor1 = const Color(0xFFFFC300);
  final Color gradientColor2 = const Color(0xFFF8AA3A);

  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: ()async{
          if(!stringIsEmpty(RegisteredCheckListModel().nationalCodeFilterController.text)){
            RegisteredCheckListModel.addToActiveFiltersList(FilterType.nationalCode);
          }
          if(!stringIsEmpty(RegisteredCheckListModel().mobileNumberFilterController.text)){
            RegisteredCheckListModel.addToActiveFiltersList(FilterType.mobileNumber);
          }
          if(RegisteredCheckListModel().selectedStatusFilter != null){
            RegisteredCheckListModel.addToActiveFiltersList(FilterType.status);
          }
          if(!stringIsEmpty(RegisteredCheckListModel().startDateFilterController.text) || !stringIsEmpty(RegisteredCheckListModel().endDateFilterController.text)){
            RegisteredCheckListModel.addToActiveFiltersList(FilterType.date);
          }
          GetAllRegisteredCheckListController.run(context: context);
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: heightUtil(context,widgetVerticalPadding),
            horizontal: widthUtil(context,widgetHorizontalPadding),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: widthUtil(context,widgetHorizontalMargin)
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.2, 0.8],
                colors: [
                  gradientColor2,
                  gradientColor1,
                ]
            ),
            color: widgetColor,
            borderRadius: BorderRadius.circular(widgetBorderRadius),
          ),
          child: Center(
            child:
            Text(
              SharedStrings.confirm,
              style: textStyle,
            ),
          ),
        ),
      );
  }


}
