import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickImageAsFileController extends GetxController {
  ////////////////////////////////Method///////////////////////////////////////

  Future<XFile?> run2({
    required BuildContext context,
    required ImageSource imageSource,
    int? imageQuality,
  }) async {
    try {
      XFile? tokenImage = (await ImagePicker()
          .pickImage(source: imageSource, imageQuality: imageQuality ?? 100));
      if (tokenImage != null) {
        return tokenImage;
      }
      return null;
    } catch (err) {
      return null;
    }
  }
  //////////////////////////////////////////////////////////////////////////////
}
