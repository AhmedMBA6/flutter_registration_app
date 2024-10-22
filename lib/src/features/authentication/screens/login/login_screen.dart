import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/colors.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:flutter_registration_app/src/features/authentication/screens/login/login_footer_widgit.dart';
import 'package:flutter_registration_app/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:flutter_registration_app/src/features/authentication/screens/login/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? teamSecondaryColor : teamWhiteColor,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(defaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LoginHeaderWidget(size: size),
                LoginForm(),
                LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
