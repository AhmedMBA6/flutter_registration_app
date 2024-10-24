import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/common_widgets/form/form_header_widget.dart';
import 'package:flutter_registration_app/src/constants/image_strings.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';

class ForgotPasswordEmailScreen extends StatelessWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(defaultSize),
            child: Column(
              children: [
                SizedBox(
                  height: defaultSize * 4,
                ),
                FormHeaderWidget(
                  image: forgotPasswordImage,
                  title: tForgotPassword,
                  subTitle: tForgotPasswordSubTitle,
                  heightBetween: 30.0,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                SizedBox(
                  height: formHeight,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text(tEmail),
                        hintText: tEmail,
                        prefixIcon: Icon(Icons.mail_outline_rounded),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Next"),
                        )),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
