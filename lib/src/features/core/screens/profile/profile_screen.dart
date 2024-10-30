import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/colors.dart';
import 'package:flutter_registration_app/src/constants/image_strings.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';
import 'package:flutter_registration_app/src/features/core/screens/profile/update_profile_screen.dart';
import 'package:flutter_registration_app/src/features/core/screens/profile/widgets/profile_menu.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {Get.back();}, icon: Icon(LineAwesomeIcons.angle_left_solid)),
        title: Text(
          tProfile,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                       borderRadius: BorderRadius.circular(100),
                        child: Image(image: AssetImage(profileImage))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: teamPrimaryColor),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          LineAwesomeIcons.pencil_alt_solid,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                tProfileHeading,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                tProfileSubHeading,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => UpdateProfileScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: teamPrimaryColor,
                      side: BorderSide.none,
                      shape: StadiumBorder(),
                    ),
                    child: Text(
                      tEditProfile,
                      style: TextStyle(color: teamDarkColor),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),

              //Menu
              ProfileMenuWidget(
                icon: LineAwesomeIcons.cog_solid,
                title: tMenu1,
                onPressed: () {},
              ),
              ProfileMenuWidget(
                icon: LineAwesomeIcons.wallet_solid,
                title: tMenu2,
                onPressed: () {},
              ),
              ProfileMenuWidget(
                icon: LineAwesomeIcons.user_check_solid,
                title: tMenu3,
                onPressed: () {},
              ),
              ProfileMenuWidget(
                icon: LineAwesomeIcons.info_solid,
                title: tMenu4,
                onPressed: () {},
              ),
              ProfileMenuWidget(
                icon: LineAwesomeIcons.sign_out_alt_solid,
                title: tMenu5,
                onPressed: () {},
                textColor: Colors.red,
                endIcon: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
