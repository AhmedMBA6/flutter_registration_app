import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/colors.dart';
import 'package:flutter_registration_app/src/constants/image_strings.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';
import 'package:flutter_registration_app/src/repository/authentication_repository/authentication_repository.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSize {
  const DashboardAppBar({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      title: Text(
        appName,
        style: txtTheme.headlineMedium,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Container(
          margin: EdgeInsets.only(top: 7, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: teamCardBgColor,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image(image: AssetImage(userProfileImage)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 7, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: teamCardBgColor,
          ),
          child: IconButton(
            onPressed: () {
              AuthenticationRepository.instance.logout();
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(55);
}
