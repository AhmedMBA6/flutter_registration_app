import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_registration_app/src/constants/colors.dart';
import 'package:flutter_registration_app/src/constants/image_strings.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';
import 'package:flutter_registration_app/src/features/authentication/controllers/login_controller.dart';
import 'package:flutter_registration_app/src/utils/socials/social_button.dart';
import 'package:get/get.dart';

class SocialFooter extends StatelessWidget {
  const SocialFooter({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Container(
      padding: EdgeInsets.only(top: defaultSize * 1.5, bottom: defaultSize),
      child: Column(
        children: [
          Obx(
            () => SocialButton(
              text: "${tConnectWith.tr} ${tGoogle.tr}",
              image: googleLogoImage,
              foreground: teamAccentColor,
              background: teamWhiteColor,
              isLoading: controller.isGoogleLoading.value ? true : false,
              onPressed: controller.isFacebookLoading.value ||
                      controller.isLoading.value
                  ? () {}
                  : controller.isGoogleLoading.value
                      ? () {}
                      : () => controller.googleSignIn,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => SocialButton(
                text: "${tConnectWith.tr} ${tFacebook.tr}",
                image: facebookLogoImage,
                foreground: teamDarkColor,
                background: teamAccentColor,
                isLoading: controller.isFacebookLoading.value ? true : false,
                onPressed: controller.isGoogleLoading.value ||
                        controller.isLoading.value
                    ? () {}
                    : controller.isFacebookLoading.value
                        ? () {}
                        : () => {}),
          ),
          SizedBox(
            height: defaultSize * 2,
          ),
        ],
      ),
    );
  }
}
