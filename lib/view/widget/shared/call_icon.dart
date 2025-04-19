import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import '../../../model/notification_messages_model.dart';
import '../../../utils/assets_paths.dart';
import '../../../utils/colors.dart';
import '../../../utils/shared_strings.dart';
import '../../../utils/url_launcher_manager.dart';





class CallIcon extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetWidth = 0.1;

  final Color widgetColor = MyColors.deepGreen;

  final double widgetBorderRadius = 5;
  final Color gradientColor1 = MyColors.deepYellow.withOpacity(0.7);
  final Color gradientColor2 = MyColors.yellowAccent.withOpacity(0.8);
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<NotificationMessagesModel>(init: NotificationMessagesModel(), builder: (_) => // Initialize NotificationMessagesModel Class For RealTime Data Using GetX State Management
      GestureDetector(
        onTap: (){
          UrlLauncherManager.openDialPad(context, SharedStrings.bargramSupportNumber);
        },
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
              // gradient: LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     stops: const [0.2, 0.8],
              //     colors: [
              //       gradientColor1,
              //       gradientColor2,
              //     ]
              // ),
              color: widgetColor,
              borderRadius: BorderRadius.circular(widgetBorderRadius)
          ),
          height: widthUtil(context,widgetWidth),
          width: widthUtil(context,widgetWidth),
          // width: widthUtil(context,widgetWidth),
          child: Center(
            child: SvgPicture.asset(
              AssetPaths.dotCallIcon,
              color: Colors.white,
              height: widthUtil(context,widgetWidth*0.7),
              width: widthUtil(context,widgetWidth*0.7),
            ),
          ),
        ),
      )
      );
  }
}
