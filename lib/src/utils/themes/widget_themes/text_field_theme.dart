import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/colors.dart';

class TeamTextFieldTheme {
  TeamTextFieldTheme._();

  static InputDecorationTheme lightInputDecurationTheme = InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: teamSecondaryColor,
    suffixIconColor: teamSecondaryColor,
    floatingLabelStyle: TextStyle(color: teamSecondaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: teamSecondaryColor,
      ),
    ),
  );

  static InputDecorationTheme darkInputDecurationTheme = InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: teamPrimaryColor,
    suffixIconColor: teamPrimaryColor,
    floatingLabelStyle: TextStyle(color: teamPrimaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: teamPrimaryColor,
      ),
    ),
  );
}
