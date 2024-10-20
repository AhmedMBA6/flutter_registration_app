import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/colors.dart';
import 'package:flutter_registration_app/src/constants/image_strings.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var hieght = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? teamSecondaryColor : teamPrimaryColor,
      body: Container(
        padding: EdgeInsets.all(defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(welcomeImage),
              height: hieght * 0.5,
            ),
            Column(
              children: [
                Text(
                  tWelcomeTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  tWelcomeSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {}, child: Text(tLogin.toUpperCase()))),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(tSingup.toUpperCase()),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
