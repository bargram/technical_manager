import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../utils/size_utils.dart';




class ThreeDotsLoading extends StatelessWidget {

  //Constructor
  Color? color;
  ThreeDotsLoading({this.color});

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(14),color: const Color(0xFF43433D));

  final Color loadingIndicatorColor = Colors.black.withOpacity(0.6);
  final double loadingIndicatorSize = 20;

  final double widgetVerticalMargin = 0.01;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: heightUtil(context,widgetVerticalMargin)
      ),
      child: SpinKitThreeBounce(
        color: color ?? loadingIndicatorColor,
        size: ScreenUtil().setSp(loadingIndicatorSize),
      ),
    );
  }
}
