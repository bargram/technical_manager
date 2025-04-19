import 'package:flutter/material.dart';
import 'package:bargram_technical_manager/model/confirm_sms_code_model.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/assets_paths.dart';
import '../../../utils/colors.dart';





class ConfirmLoginSMSCodePageBackButton extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final double iconWidth = 0.04;
  final Color iconColor = MyColors.deepBlue;
  final double widgetVerticalPadding = 0.01;
  final double widgetHorizontalPadding = 0.025;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            ConfirmLoginSMSCodeModel.resetCodePartsAndPassword(); // clear text fields
            Navigator.pop(context);
          },
          child: SizedBox(
            height: widthUtil(context, iconWidth),
            width: widthUtil(context, iconWidth),
            child: FittedBox(child: SvgPicture.asset(AssetPaths.dismissSvgIcon, color: iconColor,)),
          ),
        ),
      ],
    );
  }
}
