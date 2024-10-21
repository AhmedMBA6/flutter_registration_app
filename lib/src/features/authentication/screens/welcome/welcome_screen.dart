import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:flutter_registration_app/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:flutter_registration_app/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:flutter_registration_app/src/constants/colors.dart';
import 'package:flutter_registration_app/src/constants/image_strings.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();
    var mediaQuery = MediaQuery.of(context);
    var hieght = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? teamSecondaryColor : teamPrimaryColor,
      body: Stack(
        children: [
          TeamFadeAnimation(
            durationInMs: 1200,
            animate: TeamAnimationPosition(
              topAfter: 0,
              topBefore: 0,
              bottomAfter: 0,
              bottomBefore: -100,
              rightAfter: 0,
              rightBefore: 0,
              leftAfter: 0,
              leftBefore: 0,
            ),
            child: Container(
              padding: EdgeInsets.all(defaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: AssetImage(welcomeImage),
                    height: hieght * 0.5,
                  ),
                  Column(
                    children: [
                      Text(
                        tWelcomeTitle,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        tWelcomeSubTitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: OutlinedButton(
                              onPressed: () {},
                              child: Text(tLogin.toUpperCase()))),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(tSingup.toUpperCase()),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
