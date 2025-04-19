import 'package:bargram_technical_manager/model/dto/enum/check_list_status.dart';
import 'package:bargram_technical_manager/view/widget/registered_check_list_page/registered_check_list_page_change_status_button.dart';
import 'package:bargram_technical_manager/view/widget/shared/downloading_image.dart';
import 'package:bargram_technical_manager/view/widget/shared/plaque.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/dto/check_list.dart';
import '../../../utils/assets_paths.dart';
import '../../../utils/colors.dart';
import '../../../utils/shared_strings.dart';
import 'registered_check_list_page_detail_button.dart';
import 'registered_check_list_page_get_tracking_code_button.dart';






class RegisteredCheckListPageBillLoadingsListItem extends StatelessWidget {

  //Constructor
  CheckList checkList;
  RegisteredCheckListPageBillLoadingsListItem(this.checkList);
  ///////////

//////////////////////////////Widget Styles///////////////////////////////////
  final double widgetWidth = 1;

  final double iconWidth = 0.05;
  final Color iconColor = MyColors.white;
  final Color widgetColor = MyColors.white;

  final double imageWidth = 0.6;
  final double widgetVerticalPadding = 0.02;
  final double widgetHorizontalPadding = 0.025;
  final double widgetHorizontalMargin = 0.05;

  final double widgetVerticalMargin = 0.02;
  final TextStyle blueBoldTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.deepBlue, fontWeight:FontWeight.bold);
  final TextStyle redBoldTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.red, fontWeight:FontWeight.bold);
  final TextStyle greenBoldTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.deepGreen, fontWeight:FontWeight.bold);
  final TextStyle blueTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.deepBlue,);
  final TextStyle blackTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.black.withOpacity(0.75),);
  final TextStyle blackBoldTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.black, fontWeight:FontWeight.bold);
  final TextStyle greyTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.grey,);
  //////////////////////////////End Of Widget Styles////////////////////////////


  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: widthUtil(context, widgetHorizontalPadding),
          vertical: widthUtil(context, widgetVerticalPadding),
        ),
        margin: EdgeInsets.symmetric(
          vertical: widthUtil(context, widgetVerticalMargin),
          horizontal: widthUtil(context, widgetHorizontalMargin),
        ),
        decoration: BoxDecoration(
            color: widgetColor,
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 24,
                offset: Offset(0, 4),
                spreadRadius: 2,
              )
            ]
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text('${SharedStrings.id} : ${checkList.id}', style:blueBoldTextStyle, textAlign:TextAlign.start,)),
                Expanded(child: Text('${SharedStrings.status} : ${
                    checkList.status == CheckListStatus.CONFIRM? SharedStrings.confirm:
                    checkList.status == CheckListStatus.PENDING? SharedStrings.pending:
                    SharedStrings.rejected}', style:blueBoldTextStyle, textAlign:TextAlign.end,)),
              ],
            ),
            SizedBox(height:heightUtil(context, 0.01),),
            DottedLine(direction: Axis.horizontal, alignment: WrapAlignment.center, lineLength: double.infinity, lineThickness: 1.0, dashLength: 4.0, dashColor:MyColors.deepBlue, dashRadius: 0.0, dashGapLength: 4.0, dashGapColor: Colors.white, dashGapRadius: 0.0),
            // SizedBox(height:heightUtil(context, 0.01),),
            // const DottedLine(direction: Axis.horizontal, alignment: WrapAlignment.center, lineLength: double.infinity, lineThickness: 1.0, dashLength: 4.0, dashColor: Colors.black, dashRadius: 0.0, dashGapLength: 4.0, dashGapColor: Colors.white, dashGapRadius: 0.0),
            SizedBox(height:heightUtil(context, 0.01),),
            Row(
              children: [
                SizedBox(
                    height: widthUtil(context,iconWidth),
                    width: widthUtil(context,iconWidth),
                    child: Image.asset(AssetPaths.calendarIcon, color:MyColors.deepGreen,)
                ),
                SizedBox(width:widthUtil(context, 0.01),),
                Expanded(child: Text('${SharedStrings.fireCapsuleDate} : ${checkList.capsuleDate}', style:blackTextStyle, textAlign:TextAlign.start,)),
              ],
            ),
            SizedBox(height:heightUtil(context, 0.01),),
            Row(
              children: [
                SizedBox(
                    height: widthUtil(context,iconWidth),
                    width: widthUtil(context,iconWidth),
                    child: Image.asset(AssetPaths.calendarIcon, color:MyColors.deepGreen,)
                ),
                SizedBox(width:widthUtil(context, 0.01),),
                Expanded(child: Text('${SharedStrings.technicalLicenseDate} : ${checkList.technicalLicenseDate}', style:blackTextStyle, textAlign:TextAlign.start,)),
              ],
            ),
            SizedBox(height:heightUtil(context, 0.01),),
            Row(
              children: [
                SizedBox(
                    height: widthUtil(context,iconWidth),
                    width: widthUtil(context,iconWidth),
                    child: Icon(Icons.router_outlined, color:MyColors.deepGreen,)
                ),
                SizedBox(width:widthUtil(context, 0.01),),
                Expanded(child: Text('${SharedStrings.ipAddress} : ${checkList.ip}', style:blackTextStyle, textAlign:TextAlign.start,)),
              ],
            ),
            SizedBox(height:heightUtil(context, 0.01),),
            Row(
              children: [
                SizedBox(
                    height: widthUtil(context,iconWidth),
                    width: widthUtil(context,iconWidth),
                    child: Icon(Icons.person, color:MyColors.deepGreen,)
                ),
                SizedBox(width:widthUtil(context, 0.01),),
                Expanded(child: Text('${SharedStrings.driverName} : ${checkList.driverName}', style:blackTextStyle, textAlign:TextAlign.start,)),
              ],
            ),
            SizedBox(height:heightUtil(context, 0.01),),
            Row(
              children: [
                SizedBox(
                    height: widthUtil(context,iconWidth),
                    width: widthUtil(context,iconWidth),
                    child: Image.asset(AssetPaths.calendarIcon, color:MyColors.deepGreen,)
                ),
                SizedBox(width:widthUtil(context, 0.01),),
                Expanded(child: Text('${SharedStrings.checkListCreatedDate} : ${checkList.createdDate}', style:blackTextStyle, textAlign:TextAlign.start,)),
              ],
            ),

            checkList.car == null? Container():
            SizedBox(height:heightUtil(context, 0.01),),
            checkList.car == null? Container():
            Row(
              children: [
                SizedBox(
                    height: widthUtil(context,iconWidth),
                    width: widthUtil(context,iconWidth),
                    child: Icon(CupertinoIcons.car_detailed, color:MyColors.deepGreen,)
                ),
                SizedBox(width:widthUtil(context, 0.01),),
                Plaque(checkList.car!.plaquePart3, checkList.car!.plaquePart2, checkList.car!.plaquePart1, checkList.car!.plaquePart4)
              ],
            ),

            checkList.trackingCode == 'null'? Container():
            SizedBox(height:heightUtil(context, 0.01),),
            checkList.trackingCode == 'null'? Container():
            Row(
              children: [
                SizedBox(
                    height: widthUtil(context,iconWidth),
                    width: widthUtil(context,iconWidth),
                    child: Icon(CupertinoIcons.car_detailed, color:MyColors.deepGreen,)
                ),
                SizedBox(width:widthUtil(context, 0.01),),
                Expanded(child: Text('${SharedStrings.trackingCode} : ${checkList.trackingCode}', style:blackTextStyle, textAlign:TextAlign.start,)),
              ],
            ),

            SizedBox(height:heightUtil(context, 0.01),),

            DownloadingImage(imagePath:checkList.signatureUrl, imageHeight:widthUtil(context, imageWidth), imageWidth:widthUtil(context, imageWidth)),

            SizedBox(height:heightUtil(context, 0.01),),

            Row(
              children: [
                Expanded(child:Container()),
                checkList.trackingCode != 'null' || checkList.status != CheckListStatus.CONFIRM?Container():
                RegisteredCheckListPageGetTrackingCodeButton(checkList),
                checkList.trackingCode != 'null'?Container():
                RegisteredCheckListPageChangeStatusButton(checkList),
                RegisteredCheckListPageDetailButton(),
              ],
            ),


          ],
        ),
      );
  }
}
