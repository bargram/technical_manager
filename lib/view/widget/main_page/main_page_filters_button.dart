import 'dart:convert';
import 'package:bargram_technical_manager/model/dto/filter_type.dart';
import 'package:bargram_technical_manager/utils/assets_paths.dart';
import 'package:bargram_technical_manager/utils/jalali_date_picker.dart';
import 'package:bargram_technical_manager/view/page/register_check_list_page.dart';
import 'package:bargram_technical_manager/view/widget/shared/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bargram_technical_manager/controller/login_controller.dart';
import 'package:bargram_technical_manager/database/shared_preferences/shared_preferences_manager.dart';
import 'package:bargram_technical_manager/model/login_model.dart';
import 'package:bargram_technical_manager/view/widget/shared/alert.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:bargram_technical_manager/utils/string_is_empty.dart';
import 'package:bargram_technical_manager/view/widget/shared/widget_size_detector.dart';
import 'package:get/get.dart';

import '../../../controller/confirm_login_sms_code_controller.dart';
import '../../../model/confirm_sms_code_model.dart';
import '../../../model/dto/check_list.dart';
import '../../../model/dto/enum/check_list_status.dart';
import '../../../model/dto/last_sending_sms_code_time.dart';
import '../../../model/dto/timer_initializer.dart';
import '../../../model/registered_check_list_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/fonts.dart';
import '../../../utils/shared_strings.dart';
import '../../page/confirm_login_sms_code_page.dart';
import '../registered_check_list_page/registered_check_list_page_confirm_filters_button.dart';
import '../registered_check_list_page/registered_check_list_page_date_filter_button.dart';
import '../registered_check_list_page/registered_check_list_page_mobile_number_filter_button.dart';
import '../registered_check_list_page/registered_check_list_page_national_code_filter_button.dart';
import '../registered_check_list_page/registered_check_list_page_dropdown_status_filter_button.dart';
import '../registered_check_list_page/registered_check_list_page_status_filter_button.dart';





class MainPageFiltersButton extends StatelessWidget {


  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(16), color:const Color(0xFF000000), fontWeight:FontWeight.bold);
  final double widgetBorderRadius = 5;
  // final Color widgetColor = const Color(0xFF39b9ea);
  final double widgetVerticalPadding = 0.02;
  final double widgetHorizontalMargin = 0.01;
  final Color widgetColor = const Color(0xFFE8E8E8);

  final Color loadingIndicatorColor = Colors.black;
  final double loadingIndicatorSize = 35;
  //////////////////////////////End Of Widget Styles////////////////////////////


  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
      onTap: ()async{
        DetailSheet(context:context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: heightUtil(context,widgetVerticalPadding),
          horizontal: widthUtil(context,widgetHorizontalMargin)
        ),
        margin: EdgeInsets.symmetric(
            horizontal: widthUtil(context,widgetHorizontalMargin)
        ),
        decoration: BoxDecoration(
          color: widgetColor,
          borderRadius: BorderRadius.circular(widgetBorderRadius),
        ),
        child: Center(
          child: Text(
            SharedStrings.filter,
            style: textStyle,
        ),
      )));
  }
  Future DetailSheet({
    required BuildContext context,
  })async{
    return
      showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return
            GetBuilder<RegisteredCheckListModel>(init: RegisteredCheckListModel(), builder: (_) => // Initialize RegisteredCheckListModel Class For RealTime Data Using GetX State Management
            DraggableScrollableSheet(
            initialChildSize: 0.8,
            expand:false,
            builder:(_,__)=>
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical:heightUtil(context, 0.025),
                    horizontal:widthUtil(context, 0.025),
                  ),
                  child: Column(
                      children: [
                        SizedBox(height:heightUtil(context, 0.025),),
                        Text(SharedStrings.filters, style:textStyle),
                        SizedBox(height:heightUtil(context, 0.025),),
                        Row(

                          children: [
                            !RegisteredCheckListModel().activeFilters.contains(FilterType.nationalCode)?Container():
                            RegisteredCheckListPageNationalCodeFilterButton(),
                            !RegisteredCheckListModel().activeFilters.contains(FilterType.mobileNumber)?Container():
                            RegisteredCheckListPageMobileNumberFilterButton(),
                            !RegisteredCheckListModel().activeFilters.contains(FilterType.status)?Container():
                            RegisteredCheckListPageStatusFilterButton(),
                            !RegisteredCheckListModel().activeFilters.contains(FilterType.date)?Container():
                            RegisteredCheckListPageDateFilterButton(),

                          ]
                        ),
                        SizedBox(height:heightUtil(context, 0.025),),
                        Expanded(child:Container()),
                        CustomTextField(
                            textEditingController:RegisteredCheckListModel().nationalCodeFilterController,
                            label: SharedStrings.nationalCode,
                            iconData: Icons.credit_card_outlined,
                            iconPath: null,
                            iconColor: MyColors.black,
                            isNumeric: true
                        ),
                        SizedBox(height:heightUtil(context, 0.025),),
                        CustomTextField(
                            textEditingController:RegisteredCheckListModel().mobileNumberFilterController,
                            label: SharedStrings.mobileNumber,
                            iconData: null,
                            iconPath: AssetPaths.phoneIcon,
                            iconColor: MyColors.black,
                            isNumeric: true
                        ),
                        SizedBox(height:heightUtil(context, 0.025),),
                        RegisteredCheckListPageDropdownStatusFilterButton(),
                        SizedBox(height:heightUtil(context, 0.05),),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: ()async{
                                  var pickedDate = await JalaliDatePicker().pickJalaliGeorgianDate(context);
                                  if(pickedDate == null) return;
                                  RegisteredCheckListModel().startDateFilterController.text = '${pickedDate.year}/${pickedDate.month}/${pickedDate.day}';
                                },
                                child: CustomTextField(
                                    textEditingController:RegisteredCheckListModel().startDateFilterController,
                                    label: SharedStrings.fromDate,
                                    iconData: Icons.calendar_month,
                                    iconPath: null,
                                    iconColor: MyColors.black,
                                    isNumeric:false,
                                    enabled:false,
                                ),
                              ),
                            ),
                            SizedBox(width:widthUtil(context, 0.025),),
                            Expanded(
                              child: GestureDetector(
                                onTap: ()async{
                                  var pickedDate = await JalaliDatePicker().pickJalaliGeorgianDate(context);
                                  if(pickedDate == null) return;
                                  RegisteredCheckListModel().endDateFilterController.text = '${pickedDate.year}/${pickedDate.month}/${pickedDate.day}';
                                },
                                child: CustomTextField(
                                    textEditingController:RegisteredCheckListModel().endDateFilterController,
                                    label: SharedStrings.toDate,
                                    iconData: Icons.calendar_month,
                                    iconPath: null,
                                    iconColor: MyColors.black,
                                    isNumeric:false,
                                    enabled:false,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:heightUtil(context, 0.025),),
                        Expanded(child:Container()),
                        RegisteredCheckListPageConfirmFiltersButton(),
                        SizedBox(height:heightUtil(context, 0.025),),
                        Expanded(child:Container()),
                      ]
                  ),
                ),
          ));
        });

  }

}
