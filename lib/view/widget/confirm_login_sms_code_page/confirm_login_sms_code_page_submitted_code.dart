
import 'package:bargram_technical_manager/utils/colors.dart';
import 'package:bargram_technical_manager/utils/shared_strings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/model/confirm_sms_code_model.dart';
import 'package:bargram_technical_manager/utils/focus_nodes_manager/confirm_sms_code_page_focus_nodes_manager.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import '../../../controller/confirm_login_sms_code_controller.dart';
import '../../../utils/string_is_empty.dart';
import '../shared/alert.dart';



class ConfirmLoginSMSCodePageSubmitted extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(14),color: const Color(0xFF43433D));

  final double widgetHorizontalMargin = 0.0;
  //////////////////////////////End Of Widget Styles////////////////////////////


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: widthUtil(context,widgetHorizontalMargin)
      ),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SubmittedCodePart(controller:ConfirmLoginSMSCodeModel.submittedCodePart5, focusNode:ConfirmSMSCodePageFocusNodesManager.submittedCodePart5, textStyle:textStyle,),
              Expanded(child:Container()),
              _SubmittedCodePart(controller:ConfirmLoginSMSCodeModel.submittedCodePart4, focusNode:ConfirmSMSCodePageFocusNodesManager.submittedCodePart4, textStyle:textStyle,),
              Expanded(child:Container()),
              _SubmittedCodePart(controller:ConfirmLoginSMSCodeModel.submittedCodePart3, focusNode:ConfirmSMSCodePageFocusNodesManager.submittedCodePart3, textStyle:textStyle,),
              Expanded(child:Container()),
              _SubmittedCodePart(controller:ConfirmLoginSMSCodeModel.submittedCodePart2, focusNode:ConfirmSMSCodePageFocusNodesManager.submittedCodePart2, textStyle:textStyle,),
              Expanded(child:Container()),
              _SubmittedCodePart(controller:ConfirmLoginSMSCodeModel.submittedCodePart1, focusNode:ConfirmSMSCodePageFocusNodesManager.submittedCodePart1, textStyle:textStyle,),
            ],
          )
        ],
      ),
    );
  }
}


class _SubmittedCodePart extends StatefulWidget {

  //constructor
  TextEditingController controller;
  FocusNode focusNode;
  TextStyle textStyle;
  _SubmittedCodePart({required this.controller,required this.focusNode, required this.textStyle});
  ////////////

  @override
  State<_SubmittedCodePart> createState() => _SubmittedCodePartState();
}

class _SubmittedCodePartState extends State<_SubmittedCodePart> {

  //////////////////////////////Widget Styles///////////////////////////////////
  final double borderRadius = 10.0;
  final Color widgetColor = MyColors.white;
  final double widgetWidth = 0.15;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.addListener(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widgetColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      width: widthUtil(context,widgetWidth),
      child: TextField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: widget.textStyle,
        maxLength: 1,
        onChanged: (value){
          if(value != ''){
            goToNextPart(context,widget.focusNode);
          }
          if(value == ''){
            goToPreviousPart(context,widget.focusNode);
          }
        },
        decoration: InputDecoration(
          isDense: true,
          counterText: '',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color:Colors.transparent),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color:Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color:Colors.transparent),
          ),
        ),
      ),
    );
  }

  //for moving forward focuses over text fields
  void goToNextPart(BuildContext context,FocusNode focusNode){

    if(focusNode == ConfirmSMSCodePageFocusNodesManager.submittedCodePart1){
      FocusScope.of(context).requestFocus(ConfirmSMSCodePageFocusNodesManager.submittedCodePart2);
    }
    if(focusNode == ConfirmSMSCodePageFocusNodesManager.submittedCodePart2){
      FocusScope.of(context).requestFocus(ConfirmSMSCodePageFocusNodesManager.submittedCodePart3);
    }
    if(focusNode == ConfirmSMSCodePageFocusNodesManager.submittedCodePart3){
      FocusScope.of(context).requestFocus(ConfirmSMSCodePageFocusNodesManager.submittedCodePart4);
    }
    if(focusNode == ConfirmSMSCodePageFocusNodesManager.submittedCodePart4){
      FocusScope.of(context).requestFocus(ConfirmSMSCodePageFocusNodesManager.submittedCodePart5);
    }
    if(focusNode == ConfirmSMSCodePageFocusNodesManager.submittedCodePart5){
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(context).requestFocus(FocusNode());
      //after filling codes entering
      autoConfirm(context);

    }

  }

  //for moving back focuses over text fields
  void goToPreviousPart(BuildContext context,FocusNode focusNode){

    if(focusNode == ConfirmSMSCodePageFocusNodesManager.submittedCodePart5){
      FocusScope.of(context).requestFocus(ConfirmSMSCodePageFocusNodesManager.submittedCodePart4);
    }
    if(focusNode == ConfirmSMSCodePageFocusNodesManager.submittedCodePart4){
      FocusScope.of(context).requestFocus(ConfirmSMSCodePageFocusNodesManager.submittedCodePart3);
    }
    if(focusNode == ConfirmSMSCodePageFocusNodesManager.submittedCodePart3){
      FocusScope.of(context).requestFocus(ConfirmSMSCodePageFocusNodesManager.submittedCodePart2);
    }
    if(focusNode == ConfirmSMSCodePageFocusNodesManager.submittedCodePart2){
      FocusScope.of(context).requestFocus(ConfirmSMSCodePageFocusNodesManager.submittedCodePart1);
    }

  }

  //auto confirm scenario
  Future autoConfirm(BuildContext context)async{

    //checking submitted code
    if(
    stringIsEmpty(ConfirmLoginSMSCodeModel.submittedCodePart1.text) || //check code entered entirely
        stringIsEmpty(ConfirmLoginSMSCodeModel.submittedCodePart2.text) ||
        stringIsEmpty(ConfirmLoginSMSCodeModel.submittedCodePart3.text) ||
        stringIsEmpty(ConfirmLoginSMSCodeModel.submittedCodePart4.text) ||
        stringIsEmpty(ConfirmLoginSMSCodeModel.submittedCodePart5.text)
    ){
      alert(context:context, title:'', message: SharedStrings.enterEntireCode);
      return;
    }

    // //checking password
    // if(stringIsEmpty(ConfirmLoginSMSCodeModel.passwordController.text) && ConfirmLoginSMSCodeModel().twoFactorEnabled != null && ConfirmLoginSMSCodeModel().twoFactorEnabled){
    //   alert(context:context, title:'', message: ConfirmSMSCodePageStrings.enterPassword);
    //   return;
    // }


    //run controller
    ConfirmLoginSMSCodeController.run(
      context: context,
      phoneNumber: ConfirmLoginSMSCodeModel().phoneNumber.toString(),
      otpCode: ConfirmLoginSMSCodeModel.submittedCodePart1.text+
          ConfirmLoginSMSCodeModel.submittedCodePart2.text+
          ConfirmLoginSMSCodeModel.submittedCodePart3.text+
          ConfirmLoginSMSCodeModel.submittedCodePart4.text+
          ConfirmLoginSMSCodeModel.submittedCodePart5.text,
      password: ConfirmLoginSMSCodeModel.passwordController.text,
    );
  }
}
