import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../database/dbs_manager.dart';
import '../../../model/dto/filter_type.dart';
import '../../../model/main_page_model.dart';
import '../../../model/registered_check_list_model.dart';
import '../../../utils/assets_paths.dart';
import '../../../utils/colors.dart';
import '../../../utils/jalali_date_picker.dart';
import '../../../utils/shared_strings.dart';
import '../../../utils/size_utils.dart';
import '../../page/login_otp_page.dart';
import '../../page/register_check_list_page.dart';
import '../registered_check_list_page/registered_check_list_page_confirm_filters_button.dart';
import '../registered_check_list_page/registered_check_list_page_date_filter_button.dart';
import '../registered_check_list_page/registered_check_list_page_dropdown_status_filter_button.dart';
import '../registered_check_list_page/registered_check_list_page_mobile_number_filter_button.dart';
import '../registered_check_list_page/registered_check_list_page_national_code_filter_button.dart';
import '../registered_check_list_page/registered_check_list_page_status_filter_button.dart';
import '../shared/custom_text_field.dart';


class RegisterCheckListPageTopBar extends StatelessWidget {


  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetWidth = 1;

  final double iconWidth = 0.075;
  final Color iconColor = MyColors.white;
  final Color widgetColor = MyColors.deepBlue;

  final double widgetVerticalPadding = 0.01;
  final double widgetHorizontalPadding = 0.025;
  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(18), color:MyColors.white, fontWeight:FontWeight.bold);
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthUtil(context,widgetWidth),
      color: widgetColor,
      padding: EdgeInsets.only(
        top: heightUtil(context,widgetVerticalPadding)+MediaQuery.of(context).padding.top,
        bottom: heightUtil(context,widgetVerticalPadding),
          left: widthUtil(context,widgetHorizontalPadding),
          right: widthUtil(context,widgetHorizontalPadding),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  SharedStrings.registerChecklist,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Row(
            children: [
              // GestureDetector(
              //   onTap:()=> MainPageModel.scaffoldKey.currentState!.openDrawer(),
              //   child: SizedBox(
              //     height: widthUtil(context,iconWidth),
              //     width: widthUtil(context,iconWidth),
              //     child: FittedBox(child: Icon(Icons.menu, color: iconColor,)),
              //   ),
              // ),
              // SizedBox(width:widthUtil(context,0.05),),
                GestureDetector(
                  onTap:() {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: widthUtil(context,iconWidth),
                    width: widthUtil(context,iconWidth),
                    child: FittedBox(
                        child: Icon(Icons.arrow_back_outlined, color: iconColor)
                    ),
                  ),
                ),
                SizedBox(width:widthUtil(context,0.05),),
            ],
          ),
        ],
      ),
    );
  }

}
