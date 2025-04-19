import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../utils/shared_strings.dart';
import '../../../utils/size_utils.dart';



class CustomLoading extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(14),color: const Color(0xFF43433D));

  final Color loadingIndicatorColor = Colors.black;
  final double loadingIndicatorSize = 40;

  final double widgetVerticalMargin = 0.01;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: heightUtil(context,widgetVerticalMargin)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitFadingCircle(
            color: loadingIndicatorColor,
            size: ScreenUtil().setSp(loadingIndicatorSize),
          ),
          SizedBox(height:heightUtil(context, 0.01),),
          Text(
            SharedStrings.loading,
            style: textStyle,
          )
        ],
      ),
    );
  }
}
