
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../utils/fonts.dart';
import '../../../utils/shared_strings.dart';
import '../../../utils/size_utils.dart';



//this is IOS question Alert Dialog widget
Future question({
  required BuildContext context,
  String? title,
  String? message,
  String? yesLabel,
  String? noLabel,
  Function? onYes,
  Function? onNo,
  bool? isError,
})async{
  const double widgetHorizontalMargin = 0.15;
  const double widgetHorizontalPadding = 0.05;
  const double widgetVerticalPadding = 0.025;
  const double widgetBorderRadius = 20;
  const Color backgroundColorCard = Colors.white;
  final TextStyle blueTextStyle = TextStyle(fontFamily: FontsManager.vazir, fontSize: ScreenUtil().setSp(15),color:MyColors.deepBlue, fontWeight:FontWeight.bold);
  final TextStyle blackTextStyle = TextStyle(fontFamily: FontsManager.vazir, fontSize: ScreenUtil().setSp(14),color:MyColors.lightBlack, fontWeight:FontWeight.bold);
  final TextStyle whiteTextStyle = TextStyle(fontFamily: FontsManager.vazir, fontSize: ScreenUtil().setSp(15),color:Colors.white, fontWeight:FontWeight.bold);
  return showDialog(
      context: context,
      builder: (context) {
        return
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child:Container()),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widgetBorderRadius),
                  color: backgroundColorCard,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: widthUtil(context, widgetHorizontalMargin),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: widthUtil(context, widgetHorizontalPadding),
                        vertical: heightUtil(context, widgetVerticalPadding*2/3),
                      ),
                      decoration: BoxDecoration(
                          color: isError == true?MyColors.red: MyColors.deepYellow,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(widgetBorderRadius),
                            topRight: Radius.circular(widgetBorderRadius),
                          )
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              title??'',
                              style: isError == true?whiteTextStyle: blueTextStyle,
                              textAlign:TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: heightUtil(context, widgetVerticalPadding),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: widthUtil(context, widgetHorizontalPadding),
                            ),
                            child: DefaultTextStyle(
                              style: blackTextStyle,
                              child: Text(
                                message.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height:heightUtil(context, 0.01),),
                          Row(
                            children: [
                              Container(
                                // height: widthUtil(context, 0.04),
                                // width: widthUtil(context, 0.025),
                                height: 20,
                                width: 10,
                                decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(75),
                                      bottomLeft: Radius.circular(75),
                                    )
                                ),
                              ),
                              Expanded(
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 400),
                                  height: 1,
                                  // width:height == null? 0: (height!),
                                  child:const DottedLine(direction: Axis.horizontal, alignment: WrapAlignment.center, lineLength: double.infinity, lineThickness: 1.0, dashLength: 4.0, dashColor:Colors.black, dashRadius: 0.0, dashGapLength: 4.0, dashGapColor: Colors.white, dashGapRadius: 0.0),
                                ),
                              ),
                              Container(
                                height: 20,
                                width: 10,
                                decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(75),
                                      bottomRight: Radius.circular(75),
                                    )
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height:heightUtil(context, 0.015),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width:widthUtil(context, 0.05),),
                              Expanded(child: _NoButton(onNo, noLabel)),
                              SizedBox(width:widthUtil(context, 0.025),),
                              Expanded(child: _YesButton(onYes, yesLabel)),
                              SizedBox(width:widthUtil(context, 0.05),),
                            ],
                          ),
                          // SizedBox(height:heightUtil(context, 0.005),),

                        ],
                      ),
                    )

                  ],
                ),
              ),
              Expanded(child:Container()),
            ],
          );
      }
  );
}


class _YesButton extends StatelessWidget {

  //Constructor
  Function? onYes;
  String? yesLabel;
  _YesButton(this.onYes, this.yesLabel);
  ////////////

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(16),color: MyColors.white, fontWeight:FontWeight.bold);
  final double widgetBorderRadius = 5;
  final Color widgetColor = MyColors.green;
  final double widgetVerticalPadding = 0.01;
  final double widgetHorizontalPadding = 0.075;
  final Color widgetRippleColor = MyColors.whiteSplash;

  final Color gradientColor1 = MyColors.deepYellow.withOpacity(0.7);
  final Color gradientColor2 = MyColors.yellowAccent.withOpacity(0.8);
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widgetColor,
        borderRadius: BorderRadius.circular(widgetBorderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: widgetRippleColor,
          highlightColor: Colors.transparent,
          onTap: (){
            Navigator.pop(context);
            if(onYes != null )onYes!();
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: heightUtil(context,widgetVerticalPadding),
                horizontal: widthUtil(context,widgetHorizontalPadding)
            ),
            child: Center(
              child: Text(
                yesLabel ?? SharedStrings.yes,
                style: textStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class _NoButton extends StatelessWidget {

  //Constructor
  Function? onNo;
  String? noLabel;
  _NoButton(this.onNo, this.noLabel);
  ////////////

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(16),color: MyColors.red, fontWeight:FontWeight.bold);
  final double widgetBorderRadius = 5;
  final Color widgetBorderColor = MyColors.red;
  final Color widgetColor = const Color(0xFFD9092F);
  final double widgetVerticalPadding = 0.01;
  final double widgetHorizontalPadding = 0.075;
  final Color widgetRippleColor = MyColors.whiteSplash;
  //////////////////////////////End Of Widget Styles////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widgetColor.withOpacity(0.15),
        border: Border.all(
            color: widgetColor
        ),
        borderRadius: BorderRadius.circular(widgetBorderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: widgetRippleColor,
          highlightColor: Colors.transparent,
          onTap: (){
            Navigator.pop(context);
            if(onNo != null )onNo!();
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: heightUtil(context,widgetVerticalPadding),
                horizontal: widthUtil(context,widgetHorizontalPadding)
            ),
            child: Center(
              child: Text(
                noLabel ?? SharedStrings.no,
                style: textStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

