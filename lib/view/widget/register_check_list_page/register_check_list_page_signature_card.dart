import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:bargram_technical_manager/view/widget/register_check_list_page/open_face_camera_widget.dart';
import 'package:finger_painter/finger_painter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

import '../../../model/register_check_list_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/shared_strings.dart';

class RegisterCheckListPageSignatureCard extends StatefulWidget {
  @override
  State<RegisterCheckListPageSignatureCard> createState() =>
      _RegisterCheckListPageSignatureCardState();
}

class _RegisterCheckListPageSignatureCardState
    extends State<RegisterCheckListPageSignatureCard> {
  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle blueTextStyle = TextStyle(
      fontSize: ScreenUtil().setSp(14),
      color: MyColors.deepBlue,
      fontWeight: FontWeight.bold);
  final TextStyle greyTextStyle = TextStyle(
      fontSize: ScreenUtil().setSp(14),
      color: MyColors.lightBlack,
      fontWeight: FontWeight.bold);
  final Color widgetColor = const Color(0xFFCCCCCC);
  PainterController painterController = PainterController();
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  void dispose() {
    RegisterCheckListModel.signaturePainterController.clearContent();
    RegisterCheckListModel.setSignatureData(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterCheckListModel>(builder: (_) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('آپلود عکس سلفی'),
              Column(
                children: [
                  if (RegisterCheckListModel().sellfieImage != null)
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        RegisterCheckListModel.setSellfieImage(null);
                      },
                      child: Row(
                        children: [
                          Text('حذف عکس',
                              style: TextStyle(
                                  color: Colors.red, fontSize: 11.sp)),
                          const Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  // SmartFaceCamera(controller: controller),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OpenFaceCameraWidget(
                              pictureSelected: (pic) {
                                if (pic != null) {
                                  RegisterCheckListModel.setSellfieImage(pic);
                                }
                              },
                            ),
                          ));
                      //  await controller.startImageStream();
                      // RegisterCheckListModel.setSellfieImage(
                      //     await PickImageAsFileController().run2(
                      //         context: context, imageSource: ImageSource.camera));
                      // RegisterCheckListModel.setSellfieImagePath(
                      //     UploadImageController().filePathUpload);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: widthUtil(context, .2),
                        height: widthUtil(context, .2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: RegisterCheckListModel().sellfieImage != null
                            ? Image.file(
                                RegisterCheckListModel().sellfieImage!,
                                fit: BoxFit.fill,
                              )
                            : const Icon(Icons.camera_alt_rounded,
                                color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(SharedStrings.technicalSignaturePlace, style: greyTextStyle),
            ],
          ),
          SizedBox(
            height: heightUtil(context, 0.01),
          ),
          Expanded(
            child: Screenshot(
              controller: RegisterCheckListModel.screenshotController,
              child: Container(
                width: widthUtil(context, 1),
                color: widgetColor,
                child: Painter(
                  controller: RegisterCheckListModel.signaturePainterController,
                  backgroundColor: widgetColor,
                  onDrawingEnded: (Uint8List? bytes) async {
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
    });
  }
}
