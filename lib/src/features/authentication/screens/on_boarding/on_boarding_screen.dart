import 'package:flutter/material.dart';
//import 'package:flutter_registration_app/main.dart';
import 'package:flutter_registration_app/src/constants/colors.dart';
import 'package:flutter_registration_app/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({super.key});
  final oBcontroller = OnBoardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            onPageChangeCallback: oBcontroller.onPageChangeCallback,
            liquidController: oBcontroller.controller,
            pages: oBcontroller.pages,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () => oBcontroller.animateToNextSlide(),
              style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.black26),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20.0),
                  overlayColor: Colors.white),
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: teamDarkColor,
                ),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => oBcontroller.skip(),
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Obx(
            () => Positioned(
              bottom: 10.0,
              child: AnimatedSmoothIndicator(
                activeIndex: oBcontroller.currentPage.value,
                count: 3,
                effect: WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 6.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
