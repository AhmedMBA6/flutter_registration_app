import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/colors.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';

class TeamElevatedButtonTheme {
  TeamElevatedButtonTheme ._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          foregroundColor: teamWhiteColor,
                          backgroundColor: teamSecondaryColor,
                          side: BorderSide(color: teamSecondaryColor),
                          padding: EdgeInsets.symmetric(vertical: buttonHeight),
                        ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          foregroundColor: teamSecondaryColor,
                          backgroundColor: teamWhiteColor,
                          side: BorderSide(color: teamSecondaryColor),
                          padding: EdgeInsets.symmetric(vertical: buttonHeight),
                        ),
  );
}