import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_registration_app/src/constants/colors.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';
import 'package:flutter_registration_app/src/features/authentication/controllers/otp_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    var otpController = Get.put(OtpController());
    var otp;
    return Scaffold(
      backgroundColor: isDarkMode ? teamSecondaryColor : Colors.white,
      body: Container(
        padding: EdgeInsets.all(defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tOtpTitle,
              style: GoogleFonts.montserrat(
                // color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 80.0,
              ),
            ),
            Text(
              tOtpSubTitle.toUpperCase(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              tOtpMessage,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            OtpTextField(
                numberOfFields: 6,
                cursorColor: Colors.white,
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                onSubmit: (code) {
                  otp = code;
                  OtpController.instance.verifyOTP(otp);
                }),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  OtpController.instance.verifyOTP(otp);
                },
                child: Text("Next"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
