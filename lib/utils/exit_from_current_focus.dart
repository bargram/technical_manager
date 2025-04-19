
import 'package:flutter/material.dart';


void exitFromCurrentFocus(BuildContext context){
  FocusManager.instance.primaryFocus!.unfocus();
  FocusScope.of(context).requestFocus(FocusNode());
}