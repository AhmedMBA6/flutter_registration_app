import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/image_strings.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            label: Text(tSignInWithGoogle.toUpperCase()),
            icon: Image(
              image: AssetImage(googleLogoImage),
              width: 20.0,
            ),
          ),
        ),
        SizedBox(
          height: formHeight - 20,
        ),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
                text: tdontHaveAccount,
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: tSingup.toUpperCase(),
                    style: TextStyle(color: Colors.blue),
                  ),
                ]),
          ),
        )
      ],
    );
  }
}
