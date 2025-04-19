import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import '../../../model/dto/register_check_list_item.dart';
import '../../../utils/colors.dart';
import '../../../utils/shared_strings.dart';




class RegisterCheckListPageGeneralCardStatus extends StatelessWidget {

  RegisterCheckListItem item;
  RegisterCheckListPageGeneralCardStatus(this.item);

  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetWidth = 1;

  final double widgetVerticalPadding = 0.015;
  final TextStyle blueTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.deepBlue, fontWeight:FontWeight.bold);
  final TextStyle greenTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.deepGreen, fontWeight:FontWeight.bold);
  final TextStyle redTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.red, fontWeight:FontWeight.bold);

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
                flex: 2,
                child: Text(
                  item.title.toString(),
                  style: blueTextStyle,
                  textAlign:TextAlign.start,
                ),
              ),
              Expanded(
                child: Text(
                  item.approveStatus == true?
                  SharedStrings.confirmed: SharedStrings.dismissed,
                  style: item.approveStatus == true?greenTextStyle: redTextStyle,
                  textAlign:TextAlign.end,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
