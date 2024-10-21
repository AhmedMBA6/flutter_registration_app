 //import 'package:flutter_registration_app/main.dart';
import 'package:flutter_registration_app/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:get/get.dart';

class FadeInAnimationController extends GetxController{
  static FadeInAnimationController get find => Get.find();
  RxBool animate = false.obs;

  Future startSplahAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
     animate.value = true;
    await Future.delayed(Duration(milliseconds: 5000));
    animate.value = false;
    await Future.delayed(Duration(milliseconds: 2000));
    Get.offAll(() => OnBoardingScreen());
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => HomePage()));
  }


Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
     animate.value = true;
  }

}