import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';
import 'package:flutter_registration_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter_registration_app/src/utils/helper/helper_controller.dart';
import 'package:get/get.dart';

class MailVerificationController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();
  }


  /// --- Send or Resend Email Verification
  Future<void> sendVerificationEmail () async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
    } catch (e) {
      Helper.errorSnackBar(title: tOnSnap, message: e.toString());
    }
  }

  /// ---Set Timer to check if verification completed then Redirect
  void setTimerForAutoRedirect () {
  }


  /// --- Manually check if verification completed then Redirect
  void manuallyCheckEmailVerificationStatus () {
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user!.emailVerified){
      AuthenticationRepository.instance.setIntialScreen(user);
    }}
}