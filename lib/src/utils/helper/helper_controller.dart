import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/colors.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Helper extends GetxController {
/* --======= Validations ========-- */
 // static String? validateEmail(Value) {}

// static String? validatePassword(Value) {}

/* -- ======= Snack-Bars ======== -- */

  static successSnackBar({required title, message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: teamWhiteColor,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 6),
      margin: EdgeInsets.all(defaultSize - 10),
      icon: Icon(LineAwesomeIcons.check_circle, color: teamWhiteColor,)
    );
  }

  static warningSnackBar({required title, message}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: teamDarkColor,
      backgroundColor: Colors.amberAccent,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 6),
      margin: EdgeInsets.all(defaultSize - 10),
      icon: Icon(LineAwesomeIcons.check_circle, color: teamWhiteColor,)
    );
  }

  static errorSnackBar({required title, message}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.red,
      backgroundColor:  Colors.redAccent.withOpacity(0.1),
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 6),
      margin: EdgeInsets.all(defaultSize - 10),
      icon: Icon(LineAwesomeIcons.check_circle, color: teamWhiteColor,)
    );
  }

  static modernSnackBar({required title, message}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: teamDarkColor,
      backgroundColor: Colors.blueAccent,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 6),
      margin: EdgeInsets.all(defaultSize - 10),
      icon: Icon(LineAwesomeIcons.check_circle, color: teamWhiteColor,)
    );
  }
}
