import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';


class ListIsEmptyText extends StatelessWidget {

  String? title;
  ListIsEmptyText({this.title});

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(16), color:MyColors.lightBlack);
  //////////////////////////////End Of Widget Styles////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Text(
      title == null ? 'لیست خالی است': 'لیست $title خالی است ',
      style: textStyle,
    );
  }
}
