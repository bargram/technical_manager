
import 'package:flutter/material.dart';

//this global functions using for responsive sizes

double heightUtil(BuildContext context,double h){
  return MediaQuery.of(context).size.height * h;
}
double widthUtil(BuildContext context,double w){
  return MediaQuery.of(context).size.width * w;
}
double safeAreaSizeUtil(BuildContext context){
  return MediaQuery.of(context).padding.top;
}