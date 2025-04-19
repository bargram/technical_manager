import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors.dart';
import '../../../utils/convert_persian_numbers_to_english.dart';
import '../../../utils/fonts.dart';
import '../../../utils/size_utils.dart';




class UnderlineGreyTextField extends StatefulWidget {

  //Constructor
  TextEditingController? textEditingController;
  String? label;
  bool? isNumeric;
  int? lines;
  int? maxLength;
  bool? hasShadow;
  bool? enabled;
  String? suffixText;
  String? maxLengthString;
  Function? onTap;
  UnderlineGreyTextField({required this.textEditingController, required this.label, required this.isNumeric,
    this.lines,
    this.maxLength,
    this.hasShadow,
    this.enabled,
    this.suffixText,
    this.maxLengthString,
    this.onTap,
  });
  /////////////

  @override
  State<UnderlineGreyTextField> createState() => _UnderlineGreyTextFieldState();
}

class _UnderlineGreyTextFieldState extends State<UnderlineGreyTextField> {

//////////////////////////////Widget Styles///////////////////////////////////
  final double borderRadius = 5;
  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.black, fontFamily:FontsManager.vazir);
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
          child: widget.isNumeric == false ?
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              enabled:widget.enabled ?? true,
              controller: widget.textEditingController,
              maxLength: widget.maxLength,
              maxLines: widget.lines ?? 1,
              onTap: (){
                if(widget.onTap!=null){
                  widget.onTap!();
                }
              },
              onChanged: (v){
                setState(() {});
              },
              style: textStyle,
              decoration: InputDecoration(
                enabled:widget.enabled ?? true,
                hintStyle: textStyle,
                contentPadding: EdgeInsets.symmetric(
                  horizontal:widthUtil(context, 0.025),
                  vertical:widthUtil(context, 0.025),
                ),
                counterText: '',
                floatingLabelBehavior:FloatingLabelBehavior.auto,
                labelText: widget.label,
                labelStyle: textStyle,
                alignLabelWithHint: false,
                filled: false,
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
          ):
          TextField(
            enabled:widget.enabled ?? true,
            controller: widget.textEditingController,
            keyboardType: const TextInputType.numberWithOptions(decimal:false,signed:true),
            textAlign: TextAlign.end,
            style: textStyle,
            maxLength: widget.maxLength,
            onTap: (){
              if(widget.onTap!=null){
                widget.onTap!();
              }
            },
            inputFormatters: <TextInputFormatter>[
              //only accepting numbers and backspace with this filter
              FilteringTextInputFormatter.allow(RegExp(r'[0-9\b]')),
            ],
            onChanged: (value){
              widget.textEditingController!.text = convertPersianNumbersToEnglish(widget.textEditingController!.text);
              widget.textEditingController!.selection = TextSelection.fromPosition(TextPosition(offset: widget.textEditingController!.text.length));
              setState(() {});
            },

            decoration: InputDecoration(
              counterText: widget.maxLengthString ?? '',
              suffixText: widget.suffixText,
              contentPadding: EdgeInsets.symmetric(
                horizontal:widthUtil(context, 0.025),
                vertical:widthUtil(context, 0.025),
              ),
              // counterText: '',
              // counterStyle: textStyle,
              floatingLabelBehavior:FloatingLabelBehavior.auto,
              labelText: widget.label,
              labelStyle: textStyle,
              alignLabelWithHint: false,
              filled: false,
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
        ),
        widget.maxLength == null || widget.maxLengthString == null? Container():
        Row(
          children: [
            Expanded(child: Text('${widget.textEditingController!.text.length}/${widget.maxLength}', style:textStyle, textAlign:TextAlign.end,)),
          ],
        )
      ],
    );
  }
}
