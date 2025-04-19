
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors.dart';
import '../../../utils/fonts.dart';
import '../../../utils/shared_strings.dart';
import '../../../utils/size_utils.dart';




Future alert({required BuildContext context, required String title, required String message, Function? onUnderstand, bool? isError})async{
  const double widgetHorizontalMargin = 0.15;
  const double widgetHorizontalPadding = 0.05;
  const double widgetVerticalPadding = 0.025;
  const double widgetBorderRadius = 20;
  const Color backgroundColorCard = Colors.white;
  final TextStyle blueTextStyle = TextStyle(fontFamily: FontsManager.vazir, fontSize: ScreenUtil().setSp(15),color:MyColors.deepBlue, fontWeight:FontWeight.bold);
  final TextStyle blackTextStyle = TextStyle(fontFamily: FontsManager.vazir, fontSize: ScreenUtil().setSp(14),color:MyColors.lightBlack, fontWeight:FontWeight.bold);
  final TextStyle whiteTextStyle = TextStyle(fontFamily: FontsManager.vazir, fontSize: ScreenUtil().setSp(15),color:Colors.white, fontWeight:FontWeight.bold);
  return showDialog(
      context: context,
      builder: (context) {
        return
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child:Container()),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widgetBorderRadius),
                  color: backgroundColorCard
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: widthUtil(context, widgetHorizontalMargin),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: widthUtil(context, widgetHorizontalPadding),
                        vertical: heightUtil(context, widgetVerticalPadding*2/3),
                      ),
                      decoration: BoxDecoration(
                          color: isError == true?MyColors.red: MyColors.deepYellow,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(widgetBorderRadius),
                            topRight: Radius.circular(widgetBorderRadius),
                          )
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: isError == true?whiteTextStyle: blueTextStyle,
                              textAlign:TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: heightUtil(context, widgetVerticalPadding),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:EdgeInsets.symmetric(
                              horizontal: widthUtil(context, widgetHorizontalPadding),
                            ),
                            child: DefaultTextStyle(
                              style: blackTextStyle,
                              child: Text(
                                message.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height:heightUtil(context, 0.01),),
                          Row(
                            children: [
                              Container(
                                // height: widthUtil(context, 0.04),
                                // width: widthUtil(context, 0.025),
                                height: 20,
                                width: 10,
                                decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(75),
                                      bottomLeft: Radius.circular(75),
                                    )
                                ),
                              ),
                              Expanded(
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 400),
                                  height: 1,
                                  // width:height == null? 0: (height!),
                                  child:const DottedLine(direction: Axis.horizontal, alignment: WrapAlignment.center, lineLength: double.infinity, lineThickness: 1.0, dashLength: 4.0, dashColor:Colors.black, dashRadius: 0.0, dashGapLength: 4.0, dashGapColor: Colors.white, dashGapRadius: 0.0),
                                ),
                              ),
                              Container(
                                height: 20,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(75),
                                      bottomRight: Radius.circular(75),
                                    )
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height:heightUtil(context, 0.015),),
                          Padding(
                              padding:EdgeInsets.symmetric(
                                horizontal: widthUtil(context, widgetHorizontalPadding),
                              ),
                              child: _Button(onUnderstand: onUnderstand)
                          ),

                        ],
                      ),
                    )

                  ],
                ),
              ),
              Expanded(child:Container()),
            ],
          );
      }
  );
}


class _Button extends StatelessWidget {

  //Constructor
  Function? onUnderstand;
  _Button({required this.onUnderstand});
  ////////////


  //////////////////////////////Widget Styles///////////////////////////////////
  final TextStyle textStyle = TextStyle(fontSize: ScreenUtil().setSp(16),color: MyColors.black, fontFamily:FontsManager.vazir);
  final double widgetBorderRadius = 5;
  final Color widgetColor = MyColors.lightGrey1;
  final Color widgetBorderColor = MyColors.lightBlack;
  final double widgetVerticalPadding = 0.0075;
  final double widgetHorizontalPadding = 0.075;
  final Color widgetRippleColor = MyColors.grey;
  //////////////////////////////End Of Widget Styles////////////////////////////
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widgetBorderRadius),
      child: Container(
        decoration: BoxDecoration(
            color: widgetColor,
            borderRadius: BorderRadius.circular(widgetBorderRadius),
            border: Border.all(
              color: widgetBorderColor,
            )
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: widgetRippleColor,
            highlightColor: Colors.transparent,
            onTap: (){
              if(onUnderstand != null )onUnderstand!();
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: heightUtil(context,widgetVerticalPadding),
                  horizontal: widthUtil(context,widgetHorizontalPadding)
              ),
              child: DefaultTextStyle(
                style: textStyle,
                child: Center(
                  child: Text(
                    SharedStrings.understood,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h*0.85);
    path.quadraticBezierTo(w*0.5, (h*0.75)-100, w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }

}