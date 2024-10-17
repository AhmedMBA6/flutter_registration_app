import 'package:flutter_registration_app/main.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController{
  static SplashScreenController get find => Get.find();
  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
     animate.value = true;
    await Future.delayed(Duration(milliseconds: 5000));
    Get.to(() => HomePage());
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => HomePage()));
  }

}