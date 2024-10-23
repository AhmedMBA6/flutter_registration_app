import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/common_widgets/form/form_header_widget.dart';
import 'package:flutter_registration_app/src/constants/image_strings.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';

class SingUpFormWidget extends StatelessWidget {
  const SingUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          FormHeaderWidget(
            image: welcomeImage,
            title: tSignUpTitle,
            subTitle: tSignUpSubTitle,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: formHeight - 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    label: Text(tFullName),
                    prefixIcon: Icon(Icons.person_outline_rounded),
                  ),
                ),
                SizedBox(
                  height: formHeight - 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text(tEmail),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                SizedBox(
                  height: formHeight - 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text(tPhoneNu), prefixIcon: Icon(Icons.numbers)),
                ),
                SizedBox(
                  height: formHeight - 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text(tPassword),
                      prefixIcon: Icon(Icons.fingerprint)),
                ),
                SizedBox(
                  height: formHeight - 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(tSingup),
                  ),
                ),
              ],
            ),
          ),
          Column(
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
                      text: tAlreadyHaveAccount,
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: tLogin.toUpperCase(),
                          style: TextStyle(color: Colors.blue)
                        ),
                      ]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
