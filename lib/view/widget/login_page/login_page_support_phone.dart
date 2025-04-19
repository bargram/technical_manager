import 'package:flutter/material.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors.dart';
import '../../../utils/shared_strings.dart';
import '../../../utils/url_launcher_manager.dart';
import '../shared/responsive_text_widget.dart';





class LoginPageSupportPhone extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetWidth = 0.9;
  final double widgetBorderRadius = 5;

  final double iconWidth = 0.1;
  final double iconAllSidePadding = 0.02;
  final Color iconColor = Colors.black;
  final Color iconHolderColor = const Color(0xFFffd800);

  final double widgetVerticalPadding = 0.01;
  final double widgetHorizontalPadding = 0.025;
  final TextStyle greyTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.grey, fontWeight:FontWeight.bold);
  final TextStyle blueTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.deepBlue, fontWeight:FontWeight.bold);

  final Color backgroundColor = const Color(0xFFFFFFFF);
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=> UrlLauncherManager.openDialPad(context, SharedStrings.supportNumber),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: heightUtil(context,widgetVerticalPadding),
            horizontal: widthUtil(context,widgetHorizontalPadding)
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ResponsiveText(
                    SharedStrings.callToSupportHint,
                    style: greyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width:widthUtil(context, 0.01),),
                Text(
                  SharedStrings.supportNumber,
                  style: blueTextStyle,
                  textAlign: TextAlign.center,
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
