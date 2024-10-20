import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/colors.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';

class TeamOutlinedButtonTheme {
TeamOutlinedButtonTheme ._();

static final lightOutlineButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          foregroundColor: teamSecondaryColor,
                          side: BorderSide(color: teamSecondaryColor),
                          padding: EdgeInsets.symmetric(vertical: buttonHeight),
                        ),
);

static final darkOutlineButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          foregroundColor: teamWhiteColor,
                          side: BorderSide(color: teamWhiteColor),
                          padding: EdgeInsets.symmetric(vertical: buttonHeight),
                        ),
);
}