import 'package:bargram_technical_manager/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/colors.dart';
import '../../../utils/size_utils.dart';





class CustomTextField extends StatelessWidget {

  //Constructor
  TextEditingController? textEditingController;
  String? label;
  IconData? iconData;
  String? iconPath;
  bool? isNumeric;
  int? lines;
  Color? borderColor;
  Color? iconColor;
  int? maxLength;
  String? maxLengthString;
  bool? hasShadow;
  bool? enabled;
  CustomTextField({
    required this.textEditingController,
    required this.label,
    required this.iconData,
    required this.iconPath,
    required this.isNumeric,
    this.lines,
    this.borderColor,
    this.maxLength,
    this.maxLengthString,
    this.iconColor,
    this.hasShadow,
    this.enabled,
  });
  /////////////

  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetHorizontalMargin = 0.0;

  final double prefixIconHeight = 0.05;
  final double prefixIconWidth  = 0.05;
  final double prefixIconHorizontalMargin = 0.015;
  final Color defaultIconColor = const Color.fromRGBO(255, 195, 0, 1);

  final double borderRadius = 5;
  final Color defaultBorderColor = MyColors.white;

  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(14),color:Colors.black, fontFamily:FontsManager.vazir);

  final Color fillFieldColor = MyColors.white;
  //////////////////////////////End Of Widget Styles////////////////////////////


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: hasShadow == false ?[]:
          [
            const BoxShadow(
              color: Color(0x14000000),
              blurRadius: 24,
              offset: Offset(0, 4),
              spreadRadius: 2,
            )
          ]
      ),
      margin: EdgeInsets.symmetric(
          horizontal: widthUtil(context,widgetHorizontalMargin)
      ),
      child: isNumeric == false ?
      Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: textEditingController,
          maxLength:maxLength,
          enabled: enabled ?? true,
          maxLines: lines ?? 1,
          decoration: InputDecoration(
            // counterText: '',
            floatingLabelBehavior:FloatingLabelBehavior.auto,
            labelText: label,
            labelStyle: textStyle,
            alignLabelWithHint: false,
            prefixIcon: iconData == null && iconPath == null? SizedBox(
              height: heightUtil(context,prefixIconHeight),
              width: widthUtil(context,prefixIconWidth),
            ):
            Container(
              height: heightUtil(context,prefixIconHeight),
              width: widthUtil(context,prefixIconWidth),
              margin: EdgeInsets.symmetric(horizontal:widthUtil(context,prefixIconHorizontalMargin)),
              child: iconData == null ?
              FittedBox(child: iconPath!.contains('.svg')?SvgPicture.asset(iconPath!):ImageIcon(AssetImage(iconPath!), color:iconColor??defaultIconColor)):
              FittedBox(child: Icon(iconData, color:iconColor??defaultIconColor,)),
            ),
            prefixIconConstraints: BoxConstraints(minWidth:widthUtil(context,prefixIconWidth), minHeight: heightUtil(context,prefixIconHeight)),
            fillColor: fillFieldColor,
            counterStyle: textStyle,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor ?? defaultBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor ?? defaultBorderColor),
            ),
          ),
        ),
      ):
      TextField(
        controller: textEditingController,
        keyboardType: const TextInputType.numberWithOptions(decimal:false,signed:true),
        maxLength:maxLength,
        textAlign: TextAlign.end,
        enabled: enabled ?? true,
        inputFormatters: <TextInputFormatter>[
          //only accepting numbers and backspace with this filter
          FilteringTextInputFormatter.allow(RegExp(r'[0-9\b]')),
        ],
        decoration: InputDecoration(
          counterText: maxLengthString ?? '',
          floatingLabelBehavior:FloatingLabelBehavior.auto,
          labelText: label,
          labelStyle: textStyle,
          alignLabelWithHint: false,
          suffixIcon: iconData == null && iconPath == null? SizedBox(
            height: heightUtil(context,prefixIconHeight),
            width: widthUtil(context,prefixIconWidth),
          ):
          Container(
            height: heightUtil(context,prefixIconHeight*1.25),
            width: widthUtil(context,prefixIconWidth*1.25),
            margin: EdgeInsets.symmetric(horizontal:widthUtil(context,prefixIconHorizontalMargin)),
            child: iconData == null ?
            FittedBox(child: iconPath!.contains('.svg')?SvgPicture.asset(iconPath!):ImageIcon(AssetImage(iconPath!), color:iconColor??defaultIconColor)):
            FittedBox(child: Icon(iconData, color:iconColor??defaultIconColor)),
          ),
          suffixIconConstraints: BoxConstraints(minWidth:widthUtil(context,prefixIconWidth*1.25), minHeight: heightUtil(context,prefixIconHeight*1.25)),
          fillColor: fillFieldColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor ?? defaultBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor ?? defaultBorderColor),
          ),
        ),
      ),
    );
  }
}
