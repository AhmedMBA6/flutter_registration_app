import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/common_widgets/form/form_header_widget.dart';
import 'package:flutter_registration_app/src/constants/image_strings.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormHeaderWidget(
          image: welcomeImage,
          title: tLoginTitle,
          subTitle: tLoginSubTitle,
        )
      ],
    );
  }
}
