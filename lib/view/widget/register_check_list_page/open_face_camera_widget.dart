import 'dart:io';

import 'package:bargram_technical_manager/utils/colors.dart';
import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef PictureSelected = void Function(File? pic);

class OpenFaceCameraWidget extends StatefulWidget {
  final PictureSelected pictureSelected;
  const OpenFaceCameraWidget({super.key, required this.pictureSelected});

  @override
  State<OpenFaceCameraWidget> createState() => _OpenFaceCameraWidgetState();
}

class _OpenFaceCameraWidgetState extends State<OpenFaceCameraWidget> {
  //////////////////////////////Widget Styles///////////////////////////////////
  final double widgetWidth = 1;

  final double iconWidth = 0.075;
  final Color iconColor = MyColors.white;
  final Color widgetColor = MyColors.deepBlue;

  final double widgetVerticalPadding = 0.01;
  final double widgetHorizontalPadding = 0.025;
  final TextStyle textStyle = TextStyle(
      fontSize: ScreenUtil().setSp(18),
      color: MyColors.white,
      fontWeight: FontWeight.bold);
  //////////////////////////////End Of Widget Styles////////////////////////////

  late FaceCameraController controller;
  @override
  void initState() {
    controller = FaceCameraController(
      autoCapture: false,
      enableAudio: false,
      defaultCameraLens: CameraLens.front,
      onCapture: (File? image) {
        widget.pictureSelected(image!);
        Navigator.pop(context);
      },
      onFaceDetected: (Face? face) {
        //Do something
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: widthUtil(context, widgetWidth),
            color: widgetColor,
            padding: EdgeInsets.only(
              top: heightUtil(context, widgetVerticalPadding) +
                  MediaQuery.of(context).padding.top,
              bottom: heightUtil(context, widgetVerticalPadding),
              left: widthUtil(context, widgetHorizontalPadding),
              right: widthUtil(context, widgetHorizontalPadding),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'عکس سلفی',
                        style: textStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: widthUtil(context, iconWidth),
                        width: widthUtil(context, iconWidth),
                        child: FittedBox(
                            child: Icon(Icons.arrow_back_outlined,
                                color: iconColor)),
                      ),
                    ),
                    SizedBox(
                      width: widthUtil(context, 0.05),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: SmartFaceCamera(
                  controller: controller,
                  indicatorShape: IndicatorShape.circle,
                  messageBuilder: (context, face) {
                    if (face == null) {
                      return _message('لطفا به دوربین سلفی نگاه کنید');
                    }
                    if (!face.wellPositioned) {
                      return _message('صورت خود را در کادر قرار دهید');
                    }
                    return const SizedBox.shrink();
                  }))
        ],
      ),
    );
  }

  Widget _message(String msg) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
        child: Text(msg,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14, height: 1.5, fontWeight: FontWeight.bold)),
      );
}
