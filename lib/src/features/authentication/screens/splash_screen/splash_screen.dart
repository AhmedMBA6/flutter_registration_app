import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:flutter_registration_app/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:flutter_registration_app/src/constants/image_strings.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:flutter_registration_app/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
    final controller = Get.put(FadeInAnimationController());
    controller.startSplahAnimation();
    return Scaffold(
      body: Stack(
        children: [
          TeamFadeAnimation(
            durationInMs: 1600,
            animate: TeamAnimationPosition(
              topAfter: 0,
              topBefore: -30,
              leftAfter: 0,
              leftBefore: -30,
            ),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image(
                image: AssetImage(splashTopIcon),
              ),
            ),
          ),
          TeamFadeAnimation(
            durationInMs: 2000,
            animate: TeamAnimationPosition(
                topBefore: 80,
                topAfter: 80,
                leftAfter: defaultSize,
                leftBefore: -80),
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
          TeamFadeAnimation(
            durationInMs: 2400,
            animate: TeamAnimationPosition(
              bottomAfter: 200,
              bottomBefore: 0,
            ),
            child: SizedBox(
              width: 370,
              height: 280,
              child: Image(
                image: AssetImage(splashImage),
              ),
            ),
          ),
          TeamFadeAnimation(
            durationInMs: 2400,
            animate: TeamAnimationPosition(
              bottomAfter: 60,
              bottomBefore: 0,
              rightAfter: defaultSize,
              rightBefore: defaultSize,
            ),
            child: Container(
              width: splashContainerSize,
              height: splashContainerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.yellow[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
