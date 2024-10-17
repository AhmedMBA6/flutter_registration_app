import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/image_strings.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';
import 'package:flutter_registration_app/src/features/authentication/controllers/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(SplashScreenController());

// * when using StatefulWidget *
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     startAnimation();
//   }

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: Duration(milliseconds: 1600),
              top: splashController.animate.value ? 0 : -30,
              left: splashController.animate.value ? 0 : -30,
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image(
                  image: AssetImage(splashTopIcon),
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: Duration(milliseconds: 1600),
              top: 80,
              left: splashController.animate.value ? defaultSize : -80,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 1600),
                opacity: splashController.animate.value ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appName,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      appTagLine,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: Duration(milliseconds: 2400),
              bottom: splashController.animate.value ? 200 : 0,
              child: AnimatedOpacity(
                opacity: splashController.animate.value ? 1 : 0,
                duration: Duration(milliseconds: 2000),
                child: SizedBox(
                  width: 370,
                  height: 280,
                  child: Image(
                    image: AssetImage(splashImage),
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: Duration(milliseconds: 2400),
              bottom: splashController.animate.value ? 60 : 0,
              right: defaultSize,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 2000),
                opacity: splashController.animate.value ? 1 : 0,
                child: Container(
                  width: splashContainerSize,
                  height: splashContainerSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.yellow[400],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
