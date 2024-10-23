import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: formHeight - 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                label: Text(tEmail),
                hintText: tEmail,
              ),
            ),
            SizedBox(
              height: formHeight,
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  hintText: tPassword,
                  label: Text(tPassword),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.remove_red_eye_sharp),
                  )),
            ),
            SizedBox(
              height: formHeight - 20,
            ),
            TextButton(
              onPressed: () {},
              child: Text(tForgotPassword),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  tLogin.toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
