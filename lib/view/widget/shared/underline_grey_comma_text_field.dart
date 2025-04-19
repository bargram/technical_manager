import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/add_comma_to_number.dart';
import '../../../utils/colors.dart';
import '../../../utils/convert_persian_numbers_to_english.dart';
import '../../../utils/fonts.dart';
import '../../../utils/size_utils.dart';
import '../../../utils/string_is_empty.dart';



class UnderlineGreyCommaTextField extends StatefulWidget {

  //Constructor
  TextEditingController? textEditingController;
  String? label;
  String? suffixText;
  int? lines;
  int? maxLength;
  bool? hasShadow;
  bool? enabled;
  UnderlineGreyCommaTextField({required this.textEditingController, required this.label,
    this.lines,
    this.maxLength,
    this.hasShadow,
    this.enabled,
    this.suffixText,
  });

  @override
  State<UnderlineGreyCommaTextField> createState() => _UnderlineGreyCommaTextFieldState();
}

class _UnderlineGreyCommaTextFieldState extends State<UnderlineGreyCommaTextField> {
  /////////////

  //////////////////////////////Widget Styles///////////////////////////////////

  final double borderRadius = 5;
  final Color defaultBorderColor = MyColors.deepYellow;

  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.black, fontFamily:FontsManager.vazir);

  final Color fillFieldColor = MyColors.grey.withOpacity(0.15);
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if(!stringIsEmpty(widget.textEditingController!.text)){
        widget.textEditingController!.text = addCommaToNumber(widget.textEditingController!.text.replaceAll(',',''));
        widget.textEditingController!.selection = TextSelection.fromPosition(TextPosition(offset: widget.textEditingController!.text.length));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.hasShadow == true?MyColors.white:null,
        boxShadow: widget.hasShadow==false?[]:[
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        enabled:widget.enabled ?? true,
        controller: widget.textEditingController,
        maxLength:widget.maxLength,
        keyboardType: TextInputType.number,
        maxLines: widget.lines ?? 1,
        textDirection: TextDirection.ltr,
        inputFormatters: <TextInputFormatter>[
          //only accepting numbers and backspace with this filter
          FilteringTextInputFormatter.allow(RegExp(r'[0-9\b]')),
        ],
        style:textStyle,
        onChanged: (value){
          widget.textEditingController!.text = convertPersianNumbersToEnglish(widget.textEditingController!.text);
          if(value != ''){
            widget.textEditingController!.text = addCommaToNumber(widget.textEditingController!.text.replaceAll(',',''));
            widget.textEditingController!.selection = TextSelection.fromPosition(TextPosition(offset: widget.textEditingController!.text.length));
          }
        },
        decoration: InputDecoration(
          // counterText: '',
          floatingLabelBehavior:FloatingLabelBehavior.auto,
          labelText: widget.label,
          labelStyle: textStyle,
          alignLabelWithHint: false,
          contentPadding: EdgeInsets.symmetric(
            horizontal:widthUtil(context, 0.025),
            vertical:widthUtil(context, 0.025),
          ),
          suffixText: widget.suffixText,
          suffixStyle: textStyle,
          // fillColor: fillFieldColor,
          // filled: true,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color: Color(0xFFF9AD33)),
          ),
        ),
      ),
    );
  }
}
