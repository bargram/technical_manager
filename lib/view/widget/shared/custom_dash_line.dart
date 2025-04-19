import 'package:flutter/material.dart';


class CustomDashLine extends StatelessWidget {
  CustomDashLine({this.height = 1, this.width = 1, this.number, this.color = Colors.black});
  double height;
  double width;
  Color color;
  int? number;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * width)).floor();
        return Flex(
          children: List.generate(number ?? dashCount, (_) {
            return SizedBox(
              width: width,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}