import 'package:bargram_technical_manager/view/widget/shared/widget_size_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/assets_paths.dart';
import '../../../utils/colors.dart';
import '../../../utils/shared_strings.dart';
import '../../../utils/size_utils.dart';
import 'custom_divider.dart';




class Plaque extends StatefulWidget {

  //Constructor
  String part1, part2, part3, part4;
  Plaque(this.part1, this.part2, this.part3, this.part4);

  @override
  State<Plaque> createState() => _PlaqueState();
}

class _PlaqueState extends State<Plaque> {

  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetWidth = 1;
  final double widgetHorizontalPadding = 0.0;
  final double widgetHorizontalMargin = 0.0;
  final Color borderColor = Colors.black;
  final Color widgetColor = MyColors.yellowAccent;
  final Color iranSectionColor = MyColors.blue;
  final double widgetBorderRadius = 5;

  final TextStyle largeTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:Colors.black, fontWeight:FontWeight.bold);
  final TextStyle smallTextStyle = TextStyle(fontSize:ScreenUtil().setSp(12), color:Colors.black, fontWeight:FontWeight.bold);
  final TextStyle smallWhiteTextStyle = TextStyle(fontSize:ScreenUtil().setSp(12), color:Colors.white, fontWeight:FontWeight.bold);
  //////////////////////////////End Of Widget Styles////////////////////////////


  double? widgetHeight;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widgetBorderRadius),
      child: WidgetSize(
        onChange: (Size size){
          if(widgetHeight == null){
            setState(() {
              widgetHeight = size.height;
            });
          }

        },
        child: Container(
          height:widgetHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widgetBorderRadius),
              border:Border.all(color:borderColor),
              color: widgetColor
          ),
          padding: EdgeInsets.symmetric(
              horizontal: widthUtil(context,widgetHorizontalPadding)
          ),
          margin: EdgeInsets.symmetric(
              horizontal: widthUtil(context,widgetHorizontalMargin)
          ),
          child:Row(
            children: [
              SizedBox(width:widthUtil(context,0.005),),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' ${SharedStrings.iran} ',
                    style:smallTextStyle,
                  ),
                  Text(
                    widget.part4,
                    style:largeTextStyle,
                  ),
                ],
              ),
              SizedBox(width:widthUtil(context,0.005),),
              CustomDivider(color:borderColor,  width:1, height:heightUtil(context,0.025),),
              SizedBox(width:widthUtil(context,0.005),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' '+widget.part3,
                    style:largeTextStyle,
                  ),
                  SizedBox(width:widthUtil(context,0.005),),
                  Text(
                    widget.part2,
                    style:largeTextStyle,
                  ),
                  SizedBox(width:widthUtil(context,0.005),),
                  Text(
                    widget.part1+' ',
                    style:largeTextStyle,
                  ),
                ],
              ),
              SizedBox(width:widthUtil(context,0.005),),
              // SizedBox(width:widthUtil(context,0.005),),
              Container(
                height:widgetHeight,
                decoration: BoxDecoration(
                  color: iranSectionColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widgetBorderRadius/2),
                    bottomLeft: Radius.circular(widgetBorderRadius/2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width:widthUtil(context,0.05), child: Image.asset(AssetPaths.iranFlag)),
                    SizedBox(height:heightUtil(context,0.0025),),
                    Text(
                      ' '+'IRAN'+' ',
                      style: smallWhiteTextStyle,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
