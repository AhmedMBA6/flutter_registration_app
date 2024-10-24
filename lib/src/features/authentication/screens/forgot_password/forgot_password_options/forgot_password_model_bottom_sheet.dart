import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/colors.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';
import 'package:flutter_registration_app/src/features/authentication/screens/forgot_password/forgot_password_email/forgot_password_mail.dart';
import 'package:flutter_registration_app/src/features/authentication/screens/forgot_password/forgot_password_options/forgot_password_btn_widget.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen {
  static Future<dynamic> buildShowModelBottomSheet(BuildContext context)
  {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return showModalBottomSheet(
      backgroundColor: isDarkMode ? teamSecondaryColor : teamWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (context) => Container(
              padding: EdgeInsets.all(defaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tForgotPasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    tForgotPasswordSubTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ForgotPasswordBtnWidget(
                    btnIcon: Icons.mail_outline_rounded,
                    title: tEmail,
                    subTitle: tResetViaEmail,
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => ForgotPasswordEmailScreen());
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ForgotPasswordBtnWidget(
                    btnIcon: Icons.mobile_friendly_rounded,
                    title: tPhoneNu,
                    subTitle: tResetViaPhone,
                    onTap: () {},
                  )
                ],
              ),
            ));
  }
}
