
import 'package:bargram_technical_manager/utils/shared_strings.dart';
import 'package:bargram_technical_manager/view/widget/shared/photo_view_dialog.dart';
import 'package:bargram_technical_manager/view/widget/shared/three_dots_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_fade/image_fade.dart';
import '../../../utils/colors.dart';



class DownloadingImage extends StatefulWidget {
  //Constructor
  String imagePath;
  double imageHeight;
  double imageWidth;
  IconData? alterIcon;
  DownloadingImage({required this.imagePath, required this.imageHeight, required this.imageWidth, this.alterIcon});
  ///////////

  @override
  State<DownloadingImage> createState() => _DownloadingImageState();
}

class _DownloadingImageState extends State<DownloadingImage> {

  //////////////////////////////Widget Styles///////////////////////////////////
  final Color loadingIndicatorColor = MyColors.red;
  final double borderRadius = 20;
  final TextStyle textStyle = TextStyle(fontSize:ScreenUtil().setSp(16), color:Colors.black.withOpacity(0.9));
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      onTap: (){
        photoViewDialog(context:context, imageProvider: NetworkImage(widget.imagePath), imagePath:widget.imagePath);
      },
      child: ClipRRect(
        borderRadius:BorderRadius.circular(borderRadius),
        child: ImageFade(
          height: widget.imageHeight,
          width: widget.imageWidth,
          image: NetworkImage(widget.imagePath),
          duration: const Duration(milliseconds: 500),
          // if the image is loaded synchronously (ex. from memory), fade in faster:
          syncDuration: const Duration(milliseconds: 150),
          alignment: Alignment.center,
          fit: BoxFit.contain,
          loadingBuilder: (context, progress, chunkEvent) =>
              SizedBox(
                height: widget.imageWidth,
                width: widget.imageWidth,
                child: Center(child: ThreeDotsLoading()),
              ),
          placeholder: GestureDetector(
            onTap: (){
              photoViewDialog(context: context, imageProvider:NetworkImage(widget.imageWidth.toString()), imagePath: widget.imageWidth.toString(), downloadable:false);
            },
            child: SizedBox(
              height: widget.imageWidth,
              width: widget.imageWidth,
            ),
          ),
            errorBuilder: (context, _) =>SizedBox(
              height: widget.imageWidth,
              width: widget.imageWidth,
              child: Center(child: Text(SharedStrings.noImage, style:textStyle)),
            ),
        ),
      ),
    );
  }
}
