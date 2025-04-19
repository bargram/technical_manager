
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import '../../../model/notification_messages_model.dart';
import '../../../utils/assets_paths.dart';
import '../../../utils/colors.dart';




class BelNotification extends StatelessWidget {

  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetWidth = 0.1;

  final Color widgetColor = Colors.white;

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
          // Navigator.of(context).push(MaterialPageRoute(builder:(_)=> BargramNotifications()));
        },
        child: Stack(
          children: [
            Container(
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
                  AssetPaths.disableBelNotificationIcon,
                  // color: Colors.black,
                  height: widthUtil(context,widgetWidth*0.7),
                  width: widthUtil(context,widgetWidth*0.7),
                ),
              ),
            ),
            NotificationMessagesModel().messagesReadingStatus == false?
            Container(
              decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle
              ),
              height: widthUtil(context,widgetWidth*0.4),
              width: widthUtil(context,widgetWidth*0.4),
            ):Container()
          ],
        ),
      )
      );
  }
}
