import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/utils/themes/widget_themes/elevated_button_theme.dart';
import 'package:flutter_registration_app/src/utils/themes/widget_themes/outlined_button_theme.dart';
import 'package:flutter_registration_app/src/utils/themes/widget_themes/text_field_theme.dart';
import 'package:flutter_registration_app/src/utils/themes/widget_themes/text_theme.dart';

class TeamAppTheme {
  TeamAppTheme._();
  static const int _deepMintGreenPrimaryValue = 0xFF1ee127;
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch:
          const MaterialColor(_deepMintGreenPrimaryValue, <int, Color>{
        50: Color(0x1A1ee127),
        100: Color(0x331ee127),
        200: Color(0x401ee127),
        300: Color(0x661ee127),
        400: Color(0x801ee127),
        500: Color(_deepMintGreenPrimaryValue),
        600: Color(0x991ee127),
        700: Color(0xB31ee127),
        800: Color(0xCC1ee127),
        900: Color(0xE61ee127),
      }),
    ),
    textTheme: TeamThemeText.lightTextTheme,
    outlinedButtonTheme: TeamOutlinedButtonTheme.lightOutlineButtonTheme,
    elevatedButtonTheme: TeamElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TeamTextFieldTheme.lightInputDecurationTheme,
  );

  static ThemeData darkTheme = ThemeData(
      textTheme: TeamThemeText.darkTextTheme,
      outlinedButtonTheme: TeamOutlinedButtonTheme.darkOutlineButtonTheme,
      elevatedButtonTheme: TeamElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: TeamTextFieldTheme.darkInputDecurationTheme,
      // brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch:
            const MaterialColor(_deepBabyBluePrimaryValue, <int, Color>{
          50: Color(0x1A1c82e3),
          100: Color(0x331c82e3),
          200: Color(0x401c82e3),
          300: Color(0x661c82e3),
          400: Color(0x801c82e3),
          500: Color(_deepBabyBluePrimaryValue),
          600: Color(0x991c82e3),
          700: Color(0xB31c82e3),
          800: Color(0xCC1c82e3),
          900: Color(0xE61c82e3),
        }),
      ));
  static const int _deepBabyBluePrimaryValue = 0xFF1c82e3;
}
