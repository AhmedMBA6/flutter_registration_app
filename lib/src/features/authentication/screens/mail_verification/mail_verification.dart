import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';
import 'package:flutter_registration_app/src/features/authentication/controllers/mail_verification_controller.dart';
import 'package:flutter_registration_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: defaultSpace * 5,
            left: defaultSpace,
            right: defaultSpace,
            bottom: defaultSpace * 2,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                LineAwesomeIcons.envelope_open,
                size: 100,
              ),
              SizedBox(
                height: defaultSpace * 2,
              ),
              Text(
                tEmailVerificationTitle.tr,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: defaultSpace,
              ),
              Text(
                tEmailVerificationSubTitle.tr,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: defaultSpace * 2,
              ),
              SizedBox(
                width: 200,
                child: OutlinedButton(
                    onPressed: () =>
                        controller.manuallyCheckEmailVerificationStatus(),
                    child: Text(tContinue.tr)),
              ),
              SizedBox(
                height: defaultSpace * 2,
              ),
              TextButton(
                onPressed: () => controller.sendVerificationEmail(),
                child: Text(tResendEmaillink.tr),
              ),
              TextButton(
                onPressed: () => AuthenticationRepository.instance.logout,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(LineAwesomeIcons.long_arrow_alt_left_solid),
                    SizedBox(width: 5,),
                    Text(tBackToLogin.tr.toLowerCase()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
