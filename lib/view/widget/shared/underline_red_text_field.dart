import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors.dart';
import '../../../utils/convert_persian_numbers_to_english.dart';
import '../../../utils/fonts.dart';
import '../../../utils/size_utils.dart';



class UnderlineRedTextField extends StatelessWidget {

  //Constructor
  TextEditingController? textEditingController;
  String? label;
  bool? isNumeric;
  int? lines;
  int? maxLength;
  bool? hasShadow;
  bool? enabled;
  String? suffixText;
  UnderlineRedTextField({required this.textEditingController, required this.label, required this.isNumeric,
    this.lines,
    this.maxLength,
    this.hasShadow,
    this.enabled,
    this.suffixText,
  });
  /////////////

  //////////////////////////////Widget Styles///////////////////////////////////

  final double prefixIconHeight = 0.05;
  final double prefixIconWidth  = 0.05;
  final double prefixIconHorizontalMargin = 0.015;
  final Color defaultIconColor = const Color.fromRGBO(255, 195, 0, 1);

  final double borderRadius = 5;
  final Color defaultBorderColor = MyColors.white;

  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.red, fontFamily:FontsManager.vazir, fontWeight:FontWeight.bold);

  final Color fillFieldColor = MyColors.red.withOpacity(0.15);
  //////////////////////////////End Of Widget Styles////////////////////////////


  @override
  Widget build(BuildContext context) {
    return Container(
      child: isNumeric == false ?
      Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          enabled:enabled ?? true,
          controller: textEditingController,
          maxLength:maxLength,
          maxLines: lines ?? 1,
          style: textStyle,
          decoration: InputDecoration(
            suffixText: suffixText,
            // counterText: '',
            floatingLabelBehavior:FloatingLabelBehavior.auto,
            labelText: label,
            labelStyle: textStyle,
            errorStyle: textStyle,
            alignLabelWithHint: false,
            prefixIconConstraints: BoxConstraints(minWidth:widthUtil(context,prefixIconWidth), minHeight: heightUtil(context,prefixIconHeight)),
            fillColor: fillFieldColor,
            filled: true,
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            disabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
      ):
      TextField(
        enabled:enabled ?? true,
        controller: textEditingController,
        keyboardType: const TextInputType.numberWithOptions(decimal:false,signed:true),
        maxLength:maxLength,
        textAlign: TextAlign.end,
        style: textStyle,
        inputFormatters: <TextInputFormatter>[
          //only accepting numbers and backspace with this filter
          FilteringTextInputFormatter.allow(RegExp(r'[0-9\b]')),
        ],
        onChanged: (value){
          textEditingController!.text = convertPersianNumbersToEnglish(textEditingController!.text);
          textEditingController!.selection = TextSelection.fromPosition(TextPosition(offset: textEditingController!.text.length));
        },
        decoration: InputDecoration(
          suffixText: suffixText,
          errorStyle: textStyle,
          // counterText: '',
          // counterStyle: textStyle,
          floatingLabelBehavior:FloatingLabelBehavior.auto,
          labelText: label,
          labelStyle: textStyle,
          alignLabelWithHint: false,
          suffixIconConstraints: BoxConstraints(minWidth:widthUtil(context,prefixIconWidth*1.25), minHeight: heightUtil(context,prefixIconHeight*1.25)),
          fillColor: fillFieldColor,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
