import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/image_strings.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
        Image(
       image: AssetImage(welcomeImage),
       height: size.height * 0.2,
     ),
     Text(
       tLoginTitle,
       style: Theme.of(context).textTheme.headlineMedium,
     ),
     Text(
       tLoginSubTitle,
       style: Theme.of(context).textTheme.titleMedium,
     ),
     ],
    );
  }
}

