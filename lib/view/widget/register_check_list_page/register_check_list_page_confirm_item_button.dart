import 'package:bargram_technical_manager/model/register_check_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import '../../../../utils/colors.dart';
import '../../../model/dto/register_check_list_item.dart';
import '../../../utils/shared_strings.dart';



class RegisterCheckListPageConfirmItemButton extends StatelessWidget {

  RegisterCheckListItem item;
  RegisterCheckListPageConfirmItemButton(this.item);

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(14),color: MyColors.white, fontWeight:FontWeight.bold);
  final double widgetBorderRadius = 5;
  final Color selectedWidgetColor = MyColors.green;
  final Color unselectedWidgetColor = MyColors.grey.withOpacity(0.5);
  final double widgetVerticalPadding = 0.01;
  final double widgetHorizontalPadding = 0.025;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: GestureDetector(
        onTap: ()async{
          RegisterCheckListModel.updateItem(item, true);
        },
        child: Container(
            padding: EdgeInsets.symmetric(
              vertical: heightUtil(context,widgetVerticalPadding),
              horizontal: heightUtil(context,widgetHorizontalPadding),
            ),
            decoration: BoxDecoration(
              color: item.approveStatus == true || item.approveStatus == null? selectedWidgetColor: unselectedWidgetColor,
              borderRadius: BorderRadius.circular(widgetBorderRadius),
            ),
            child: Center(
                child: Text(
                  SharedStrings.confirm,
                  style: textStyle,
                )
            )
        ),
      ),
    );
  }

}

