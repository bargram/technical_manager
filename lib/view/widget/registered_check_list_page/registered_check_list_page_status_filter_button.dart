import 'package:bargram_technical_manager/model/dto/filter_type.dart';
import 'package:bargram_technical_manager/model/register_check_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../controller/get_all_registered_check_list_controller.dart';
import '../../../model/registered_check_list_model.dart';
import '../../../utils/assets_paths.dart';
import '../../../utils/colors.dart';
import '../../../utils/shared_strings.dart';
import '../../../utils/size_utils.dart';
import '../main_page/main_page_filters_button.dart';




class RegisteredCheckListPageStatusFilterButton extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////

  final double iconWidth = 0.06;

  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(14), color:Colors.black);
  final TextStyle redTextStyle = TextStyle(fontSize: ScreenUtil().setSp(14), color:Colors.red);
  final Color iconColor = MyColors.grey;

  final Color backgroundColor = const Color(0xFFFFFFFF);

  final double widgetVerticalPadding = 0.01;
  final double widgetHorizontalPadding = 0.02;

  final Color dismissIconBorderColor = Colors.red.withOpacity(0.7);
  final double dismissIconVerticalPadding = 0.000;
  final Color dismissIconColor = Colors.red;
  //////////////////////////////End Of Widget Styles////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Container( //when not tapped on container , close state
      decoration: BoxDecoration(
          color: backgroundColor,
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
          vertical: heightUtil(context,widgetVerticalPadding),
          horizontal: widthUtil(context,widgetHorizontalPadding)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width:widthUtil(context, 0.015),),
          Text(
            SharedStrings.status,
            style: redTextStyle,
            textAlign: TextAlign.start,
          ),
          SizedBox(width:widthUtil(context, 0.015),),
          GestureDetector(
            onTap: ()async{
              RegisteredCheckListModel.setSelectedStatusFilter(null);
              RegisteredCheckListModel.removeFromActiveFiltersList(FilterType.status);
              GetAllRegisteredCheckListController.run(context: context);
              // if(RegisteredCheckListModel().activeFilters.isEmpty) Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: heightUtil(context,dismissIconVerticalPadding)
              ),
              height: widthUtil(context,iconWidth),
              width: widthUtil(context,iconWidth),
              child: FittedBox(
                child: Icon(Icons.cancel_outlined, color:dismissIconBorderColor,)
              ),
            ),
          )
        ],
      ),
    );
  }
}
