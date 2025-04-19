import 'package:bargram_technical_manager/view/widget/register_check_list_page/register_check_list_page_dismiss_item_button.dart';
import 'package:bargram_technical_manager/view/widget/shared/underline_grey_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:jdate/jdate.dart';
import '../../../model/dto/register_check_list_item.dart';
import '../../../model/register_check_list_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/jalali_date_picker.dart';
import '../../../utils/shared_strings.dart';
import 'register_check_list_page_technical_diagnosis_confitm_button.dart';




class RegisterCheckListPageTechnicalDiagnosisCard extends StatelessWidget {

  RegisterCheckListItem item;
  RegisterCheckListPageTechnicalDiagnosisCard(this.item);

  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetWidth = 1;

  final double widgetVerticalPadding = 0.015;
  final TextStyle blueTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.deepBlue, fontWeight:FontWeight.bold);
  final TextStyle greyTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.lightBlack);

  final Color widgetColor = MyColors.white;
  final Color widgetBorderColor = MyColors.lightBlue1.withOpacity(0.5);
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthUtil(context,widgetWidth),
      decoration: BoxDecoration(
        color: widgetColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: heightUtil(context,widgetVerticalPadding),
        vertical: heightUtil(context,widgetVerticalPadding),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  item.title.toString(),
                  style: blueTextStyle,
                  textAlign:TextAlign.start,
                ),
              ),
            ],
          ),
          SizedBox(height: heightUtil(context,0.02),),
          Row(
            children: [
              Expanded(
                child: Text(
                  SharedStrings.endOfTechnicalDiagnosisDate,
                  style: greyTextStyle,
                  textAlign:TextAlign.start,
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: ()async{
                    var pickedDate = await JalaliDatePicker().pickGeorgianDate(context);
                    if(pickedDate == null) return;
                    RegisterCheckListModel.endOfTechnicalDiagnosisController.text = '${pickedDate.toJDate().year}/${pickedDate.toJDate().month}/${pickedDate.toJDate().day}';
                    RegisterCheckListModel.setEndOfTechnicalDiagnosis(pickedDate);
                  },
                  child: UnderlineGreyTextField(
                    textEditingController: RegisterCheckListModel.endOfTechnicalDiagnosisController,
                    label: null,
                    enabled: false,
                    isNumeric: false,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: heightUtil(context,0.02),),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RegisterCheckListPageTechnicalDiagnosisConfirmItemButton(item),
              SizedBox(width:widthUtil(context, 0.02),),
              RegisterCheckListPageDismissItemButton(item),
            ],
          )
        ],
      )
    );
  }
}
