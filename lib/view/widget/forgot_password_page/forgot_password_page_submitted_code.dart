
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/utils/focus_nodes_manager/forgot_password_page_focus_nodes_manager.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';

import '../../../model/forgot_password_model.dart';



class ForgotPasswordPageSubmitted extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(14),color: const Color(0xFF43433D));

  final double widgetHorizontalMargin = 0.05;
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SubmittedCodePart(controller:ForgotPasswordModel.submittedCodePart5, focusNode:ForgotPasswordPageFocusNodesManager.submittedCodePart5, textStyle:textStyle,),
              _SubmittedCodePart(controller:ForgotPasswordModel.submittedCodePart4, focusNode:ForgotPasswordPageFocusNodesManager.submittedCodePart4, textStyle:textStyle,),
              _SubmittedCodePart(controller:ForgotPasswordModel.submittedCodePart3, focusNode:ForgotPasswordPageFocusNodesManager.submittedCodePart3, textStyle:textStyle,),
              _SubmittedCodePart(controller:ForgotPasswordModel.submittedCodePart2, focusNode:ForgotPasswordPageFocusNodesManager.submittedCodePart2, textStyle:textStyle,),
              _SubmittedCodePart(controller:ForgotPasswordModel.submittedCodePart1, focusNode:ForgotPasswordPageFocusNodesManager.submittedCodePart1, textStyle:textStyle,),
            ],
          )
        ],
      ),
    );
  }
}


class _SubmittedCodePart extends StatelessWidget {

  //constructor
  TextEditingController controller;
  FocusNode focusNode;
  TextStyle textStyle;
  _SubmittedCodePart({required this.controller,required this.focusNode, required this.textStyle});
  ////////////

  //////////////////////////////Widget Styles///////////////////////////////////
  final double borderRadius = 10.0;

  final Color borderColor = const Color(0xFFBBBBBB);

  final Color fillColor = const Color(0xFFFFFFFF);

  final double widgetHorizontalMargin = 0.01;
  final double widgetWidth = 0.15;

  //////////////////////////////End Of Widget Styles////////////////////////////


  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthUtil(context,widgetWidth),
      margin: EdgeInsets.symmetric(
          horizontal: widthUtil(context,widgetHorizontalMargin)
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: textStyle,
        maxLength: 1,
        onChanged: (value){
          if(value != ''){
            goToNextPart(context,focusNode);
          }
          if(value == ''){
            goToPreviousPart(context,focusNode);
          }
        },
        decoration: InputDecoration(
          isDense: true,
          counterText: '',
          fillColor: fillColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color:borderColor),
          ),
        ),
      ),
    );
  }

  //for moving forward focuses over text fields
  void goToNextPart(BuildContext context,FocusNode focusNode){

    if(focusNode == ForgotPasswordPageFocusNodesManager.submittedCodePart1){
      FocusScope.of(context).requestFocus(ForgotPasswordPageFocusNodesManager.submittedCodePart2);
    }
    if(focusNode == ForgotPasswordPageFocusNodesManager.submittedCodePart2){
      FocusScope.of(context).requestFocus(ForgotPasswordPageFocusNodesManager.submittedCodePart3);
    }
    if(focusNode == ForgotPasswordPageFocusNodesManager.submittedCodePart3){
      FocusScope.of(context).requestFocus(ForgotPasswordPageFocusNodesManager.submittedCodePart4);
    }
    if(focusNode == ForgotPasswordPageFocusNodesManager.submittedCodePart4){
      FocusScope.of(context).requestFocus(ForgotPasswordPageFocusNodesManager.submittedCodePart5);
    }
    if(focusNode == ForgotPasswordPageFocusNodesManager.submittedCodePart5){
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(context).requestFocus(FocusNode());
    }

  }


  //for moving back focuses over text fields
  void goToPreviousPart(BuildContext context,FocusNode focusNode){

    if(focusNode == ForgotPasswordPageFocusNodesManager.submittedCodePart5){
      FocusScope.of(context).requestFocus(ForgotPasswordPageFocusNodesManager.submittedCodePart4);
    }
    if(focusNode == ForgotPasswordPageFocusNodesManager.submittedCodePart4){
      FocusScope.of(context).requestFocus(ForgotPasswordPageFocusNodesManager.submittedCodePart3);
    }
    if(focusNode == ForgotPasswordPageFocusNodesManager.submittedCodePart3){
      FocusScope.of(context).requestFocus(ForgotPasswordPageFocusNodesManager.submittedCodePart2);
    }
    if(focusNode == ForgotPasswordPageFocusNodesManager.submittedCodePart2){
      FocusScope.of(context).requestFocus(ForgotPasswordPageFocusNodesManager.submittedCodePart1);
    }

  }
}
