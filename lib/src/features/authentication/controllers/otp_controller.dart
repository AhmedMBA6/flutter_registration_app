import 'package:flutter_registration_app/src/features/core/screens/dashboard/dashboard.dart';
import 'package:flutter_registration_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class OtpController extends GetxController{
  static OtpController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(Dashboard()) : Get.back();
  }
}