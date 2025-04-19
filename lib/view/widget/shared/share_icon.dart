// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:bargram_technical_manager/utils/size_utils.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../utils/colors.dart';
//
//
//
//
// class ShareIcon extends StatelessWidget {
//
//   //Constructor
//   Load load;
//   ShareIcon(this.load);
//   /////////////
//
//
//   //////////////////////////////Widget Styles///////////////////////////////////
//   final Color widgetColor = MyColors.white;
//   final double iconWidth = 0.085;
//   final double widgetBorderRadius = 5;
//   final double widgetHorizontalPadding = 0.01;
//   final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(14), color:MyColors.red, fontWeight:FontWeight.bold);
//   //////////////////////////////End Of Widget Styles////////////////////////////
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         ShareManager.share(
//             data:
//             'شماره اعلام بار'
//             '${load.id}',
//             subject:SharedStrings.loadAnnouncementInfo
//         );
//       },
//       child: Container(
//         height: widthUtil(context, iconWidth),
//         width: widthUtil(context, iconWidth),
//         padding: EdgeInsets.symmetric(
//             horizontal: widthUtil(context,widgetHorizontalPadding),
//             vertical: widthUtil(context,widgetHorizontalPadding)
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(widgetBorderRadius),
//           color: widgetColor,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.25),
//               spreadRadius: 1,
//               blurRadius: 1,
//               offset: const Offset(0, 0), // changes position of shadow
//             ),
//           ],
//         ),
//         child: FittedBox(child:SvgPicture.asset(AssetPaths.shareIcon)),
//       ),
//     );
//   }
// }
