import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../utils/colors.dart';
import '../../../model/register_check_list_model.dart';
import '../../../utils/assets_paths.dart';
import '../../../utils/fonts.dart';
import '../../../utils/shared_strings.dart';
import '../../../utils/size_utils.dart';


class RegisteredCheckListPageDetailButton extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.deepBlue, fontWeight:FontWeight.bold);

  final double widgetBorderRadius = 5;
  final Color widgetColor = MyColors.yellowAccent;
  final double widgetVerticalPadding = 0.01;
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
          detailSheet(context:context);
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
              SharedStrings.detail,
              style: textStyle,
            ),
          ),
        ),
      );
  }


  Future detailSheet({
    required BuildContext context,
  })async{
    const double iconWidth = 0.05;
    final TextStyle blackTextStyle = TextStyle(fontFamily: FontsManager.vazir, fontSize: ScreenUtil().setSp(16),color:MyColors.lightBlack.withOpacity(0.85), fontWeight:FontWeight.bold);
    return showModalBottomSheet(

        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        ),
    ),
    isScrollControlled: true,
    context: context,

    builder: (_) {
       return DraggableScrollableSheet(
         expand:false,
         initialChildSize: 0.9, //set this as you want
            builder:(_,__)=>
              Container(
                padding: EdgeInsets.symmetric(
                  vertical:heightUtil(context, 0.025),
                  horizontal:widthUtil(context, 0.025),
                ),
              child: SingleChildScrollView(
                child: Column(
                  children: RegisterCheckListModel().items.map((e)=>
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text(e.title, style:blackTextStyle)),
                              SizedBox(width:widthUtil(context, 0.01)),
                              SizedBox(
                                height: widthUtil(context, iconWidth),
                                width: widthUtil(context, iconWidth),
                                child: FittedBox(child: Image.asset(AssetPaths.acceptIcon)),
                              ),
                            ],
                          ),
                          SizedBox(height:heightUtil(context, 0.01),)
                        ],
                      ),
                  ).toList()
                ),
              ),
            ),
          );
    });

  }

}
