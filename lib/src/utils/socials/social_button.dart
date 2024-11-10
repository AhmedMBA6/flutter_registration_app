import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_registration_app/src/utils/socials/button_loading_widget.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.text,
    required this.image,
    this.isLoading = false,
    required this.foreground,
    required this.background,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final String image;
  final Color foreground, background;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: foreground,
              backgroundColor: background,
              side: BorderSide.none),
          icon: isLoading
              ? SizedBox()
              : Image(
                  image: AssetImage(image),
                  width: 24,
                  height: 24,
                ),
          label: isLoading
              ? ButtonLoadingWidget()
              : Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: foreground),
                )),
    );
  }
}
