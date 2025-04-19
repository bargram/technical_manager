import 'package:finger_painter/finger_painter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:screenshot/screenshot.dart';
import '../../../model/register_check_list_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/shared_strings.dart';


class RegisterCheckListPageSignatureCard extends StatefulWidget {

  @override
  State<RegisterCheckListPageSignatureCard> createState() => _RegisterCheckListPageSignatureCardState();
}

class _RegisterCheckListPageSignatureCardState extends State<RegisterCheckListPageSignatureCard> {

  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle blueTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.deepBlue, fontWeight:FontWeight.bold);
  final TextStyle greyTextStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.lightBlack, fontWeight:FontWeight.bold);
  final Color widgetColor = const Color(0xFFCCCCCC);
  PainterController painterController = PainterController();
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  void dispose() {
    // TODO: implement dispose
    RegisterCheckListModel.signaturePainterController.clearContent();
    RegisterCheckListModel.setSignatureData(null);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [Text(SharedStrings.technicalSignaturePlace, style:greyTextStyle),],),
        SizedBox(height: heightUtil(context,0.01),),
        Expanded(
          child: Screenshot(
            controller: RegisterCheckListModel.screenshotController,
            child: Container(
              width: widthUtil(context,1),
              color: widgetColor,
              child: Painter(
                controller: RegisterCheckListModel.signaturePainterController,
                backgroundColor: widgetColor,
                onDrawingEnded: (Uint8List? bytes) async{
                  RegisterCheckListModel.setSignatureData(bytes);
                },
                // the child could be ie a Google Map
                // PS: the [backgroundColor] and child are not rendered in the resulting image
              ),
            ),
          ),
        ),
      ],
    );
  }
}
