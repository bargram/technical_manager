import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/size_utils.dart';
import '../shared/responsive_text_widget.dart';



class PlaceMarker extends StatelessWidget {
  String label;
  PlaceMarker(this.label);

  //////////////////////////////Widget Styles///////////////////////////////////
  final Color widgetColor = MyColors.yellowAccent;
  //////////////////////////////End Of Widget Styles////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        // color: Colors.red,
        height: heightUtil(context,0.17),
        width: widthUtil(context,0.2),
        child: Stack(
          children: [
            SizedBox(
              // color: Colors.cyan,
              height: heightUtil(context,0.1),
              width: widthUtil(context,0.2),
              child: Center(
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        height: heightUtil(context,0.085),
                        width: 2.5
                    ),
                    Container(
                      width: 5,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                color: const Color(0xFFffffff),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey,width: 1.5),
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: widgetColor,
                    shape: BoxShape.circle
                ),
                height: heightUtil(context,0.05),
                width: widthUtil(context,0.2),
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(2.5),
                      child: ResponsiveText(
                        label,
                        height: heightUtil(context,0.035),
                        width: widthUtil(context,0.1),
                        style: TextStyle(color:MyColors.deepBlue),
                        textAlign:TextAlign.center,
                      ),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
