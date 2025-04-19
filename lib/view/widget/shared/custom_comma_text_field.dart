import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/colors.dart';
import '../../../utils/add_comma_to_number.dart';
import '../../../utils/size_utils.dart';





class CustomCommaTextField extends StatelessWidget {

  //Constructor
  TextEditingController textEditingController;
  String label;
  IconData? iconData;
  String? iconPath;
  Color? borderColor;
  CustomCommaTextField({required this.textEditingController, required this.label, required this.iconData, required this.iconPath,
    this.borderColor,
  });
  /////////////

  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetHorizontalMargin = 0.075;

  final double prefixIconHeight = 0.05;
  final double prefixIconWidth  = 0.05;
  final double prefixIconSize  = ScreenUtil().setSp(30);
  final double prefixIconHorizontalMargin = 0.025;
  final double prefixIconVerticalMargin   = 0.01;
  final Color prefixIconColor = MyColors.lightBlack;

  final double borderRadius = 15;
  final Color defaultBorderColor = MyColors.black;

  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(16), color:Colors.black);

  final Color fillFieldColor = MyColors.white;
  //////////////////////////////End Of Widget Styles////////////////////////////


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: widthUtil(context,widgetHorizontalMargin)
      ),
      child:
      TextField(
        controller: textEditingController,
        keyboardType: const TextInputType.numberWithOptions(decimal:false,signed:true),
        inputFormatters: <TextInputFormatter>[
          //only accepting numbers and backspace with this filter
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        onChanged: (value){
          textEditingController.text = addCommaToNumber(textEditingController.text.replaceAll(',',''));
          textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: textEditingController.text.length));
        },
        decoration: InputDecoration(
          // counterText: '',
          floatingLabelBehavior:FloatingLabelBehavior.auto,
          labelText: label,
          labelStyle: textStyle,
          alignLabelWithHint: false,
          prefixIcon: Container(
            margin: EdgeInsets.symmetric(horizontal:widthUtil(context,prefixIconHorizontalMargin), vertical:heightUtil(context,prefixIconVerticalMargin)),
            child: iconData == null ?
            FittedBox(child: ImageIcon(AssetImage(iconPath.toString()), color:prefixIconColor,size:prefixIconSize ,)):
            FittedBox(child: Icon(iconData, color:prefixIconColor,size:prefixIconSize ,)),
          ),
          prefixIconConstraints: BoxConstraints(minWidth:widthUtil(context,prefixIconWidth), minHeight: heightUtil(context,prefixIconHeight)),
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
