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
import '../shared/question.dart';


class MainPageTopBar extends StatelessWidget {


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
    return
      GetBuilder<RegisteredCheckListModel>(init: RegisteredCheckListModel(), builder: (_) => // Initialize RegisteredCheckListModel Class For RealTime Data Using GetX State Management
      Container(
      width: widthUtil(context,widgetWidth),
      color: widgetColor,
      padding: EdgeInsets.only(
        top: heightUtil(context,widgetVerticalPadding)+MediaQuery.of(context).padding.top,
        bottom: heightUtil(context,widgetVerticalPadding),
          left: widthUtil(context,widgetHorizontalPadding),
          right: widthUtil(context,widgetHorizontalPadding),
      ),
      child: Row(
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
          Expanded(
            child: Text(
              SharedStrings.checkLists,
              style: textStyle,
              textAlign: TextAlign.start,
              ),
            ),
            GestureDetector(
              onTap:() {
                FilterSheet(context:context);
                // MainPageModel.scaffoldKey.currentState!.openDrawer();
              },
              child: Stack(
                textDirection: TextDirection.ltr,
                children: [

                  SizedBox(
                    height: widthUtil(context,iconWidth),
                    width: widthUtil(context,iconWidth),
                    child: FittedBox(
                        child: Icon(Icons.filter_alt_outlined, color: iconColor)
                    ),
                  ),
                  RegisteredCheckListModel().activeFilters.isEmpty?Container():
                  Container(
                    height: widthUtil(context,iconWidth/2),
                    width: widthUtil(context,iconWidth/2),
                    decoration: BoxDecoration(
                      color: MyColors.red,
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child: FittedBox(child: Text(RegisteredCheckListModel().activeFilters.length.toString(), style:TextStyle(color:MyColors.white, fontWeight:FontWeight.bold))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width:widthUtil(context,0.05),),
            GestureDetector(
              onTap:() {
                Navigator.push(context, MaterialPageRoute(builder:(_)=> RegisterCheckListPage()));
                // MainPageModel.scaffoldKey.currentState!.openDrawer();
              },
              child: SizedBox(
                height: widthUtil(context,iconWidth),
                width: widthUtil(context,iconWidth),
                child: FittedBox(
                    child: RotationTransition(
                        turns: const AlwaysStoppedAnimation(-180 / 360),
                        child: Icon(Icons.add_card, color: iconColor)
                    )
                ),
              ),
            ),
            SizedBox(width:widthUtil(context,0.05),),
          GestureDetector(
            onTap:(){
              question(
                  context: context,
                  title: SharedStrings.exit,
                  message: SharedStrings.exitQuestion,
                  isError: true,
                  onYes: (){
                    DBsManager.deleteDBsData();
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) => LoginOtpPage(),
                    ),(Route<dynamic> route) => false,);
                  }
              );

            },
            child: SizedBox(
              height: widthUtil(context,iconWidth),
              width: widthUtil(context,iconWidth),
              child: FittedBox(
                  child: RotationTransition(
                      turns: const AlwaysStoppedAnimation(-180 / 360),
                      child: Icon(Icons.exit_to_app, color: iconColor)
                  )
              ),
            ),
          ),
        ],
      ),
      ));
  }
  Future FilterSheet({
    required BuildContext context,
  })async{
    final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(16), color:const Color(0xFF000000), fontWeight:FontWeight.bold);
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
