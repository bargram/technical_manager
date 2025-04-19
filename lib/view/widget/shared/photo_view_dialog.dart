
import 'package:bargram_technical_manager/utils/url_launcher_manager.dart';
import 'package:bargram_technical_manager/view/widget/shared/widget_size_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors.dart';
import '../../../utils/size_utils.dart';


 
Future photoViewDialog({required BuildContext context, required ImageProvider imageProvider, required String imagePath, bool? downloadable})async{
  const double widgetHorizontalPadding = 0.05;
  final Color widgetBackgroundColor = MyColors.yellowAccent.withOpacity(0.10);
  final Color photoBackgroundColor = MyColors.white;
  final double iconSize = ScreenUtil().setSp(35);
  final Color iconColor = MyColors.black;
  final Color iconHolderColor = MyColors.white;
  const double borderRadius = 10;
  double minHeight;
  double minWidth;
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder:(context, setStater){
            return Container(
              padding:EdgeInsets.symmetric(
                  horizontal:widthUtil(context, widgetHorizontalPadding)
              ),
              color: widgetBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height:heightUtil(context,0.01),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                              color: iconHolderColor
                          ),
                          child: Center(
                            child: GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Icon(CupertinoIcons.clear, size:iconSize, color:iconColor,)
                            ),
                          )
                      ),
                      SizedBox(width:widthUtil(context, 0.025),),
                      downloadable == false ?
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                              color: iconHolderColor
                          ),
                          child: Center(
                            child: GestureDetector(
                                onTap: (){
                                  UrlLauncherManager.launchInBrowser(context, imagePath);
                                },
                                child: Icon(CupertinoIcons.arrow_down_to_line, size:iconSize, color:iconColor,)
                            ),
                          )
                      ):Container()
                    ],
                  ),
                  // SizedBox(height:heightUtil(context,0.01),),
                  WidgetSize(
                    onChange:(Size size){
                      minHeight = size.height;
                      minWidth = size.width;
                      setStater;
                    },
                    child: Expanded(
                        flex:2,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          child:Container(
                            color: photoBackgroundColor,
                            child: InteractiveViewer(
                              // scaleEnabled: false,
                              child: Image(
                                image: imageProvider,
                              ),

                            ),
                          ),
                        )
                    ),
                  ),
                  SizedBox(height:heightUtil(context,0.02),),
                ],
              ),
            );
          },
        );
      }
  );
}
