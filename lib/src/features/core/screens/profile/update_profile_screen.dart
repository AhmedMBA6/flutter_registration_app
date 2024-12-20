import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/colors.dart';
import 'package:flutter_registration_app/src/constants/image_strings.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';
import 'package:flutter_registration_app/src/features/authentication/models/user_model.dart';
import 'package:flutter_registration_app/src/features/core/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(LineAwesomeIcons.angle_left_solid),
        ),
        title: Text(
          tEditProfile,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultSize),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;

                  //controllers
                  final email = TextEditingController(text: userData.email);
                  final fullName = TextEditingController(text: userData.fullName);
                  final phoneNu = TextEditingController(text: userData.phoneNu);
                  final password = TextEditingController(text: userData.password);


                  return Column(
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
                                  LineAwesomeIcons.camera_solid,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Form(
                          child: Column(
                        children: [
                          TextFormField(
                            controller: fullName,
                            decoration: InputDecoration(
                              label: Text(tFullName),
                              prefixIcon: Icon(Icons.person_outline_rounded),
                            ),
                          ),
                          SizedBox(
                            height: formHeight - 20,
                          ),
                          TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              label: Text(tEmail),
                              prefixIcon: Icon(Icons.person_outline_rounded),
                            ),
                          ),
                          SizedBox(
                            height: formHeight - 20,
                          ),
                          TextFormField(
                            controller: phoneNu,
                            decoration: InputDecoration(
                              label: Text(tPhoneNu),
                              prefixIcon: Icon(Icons.person_outline_rounded),
                            ),
                          ),
                          SizedBox(
                            height: formHeight - 20,
                          ),
                          TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                              label: Text(tPassword),
                              prefixIcon: Icon(Icons.person_outline_rounded),
                            ),
                          ),
                          SizedBox(
                            height: formHeight,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () async {
                                  final userData = UserModel(
                                    fullName: fullName.text.trim(),
                                    email: email.text.trim(),
                                    phoneNu: phoneNu.text.trim(),
                                    password: password.text.trim(),
                                  );
                                  await controller.updateRecord(userData);
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
                            height: formHeight,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: tJoined,
                                  style: TextStyle(fontSize: 12),
                                  children: [
                                    TextSpan(
                                      text: tJoinedAt,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.redAccent.withOpacity(0.1),
                                    elevation: 0,
                                    side: BorderSide.none,
                                    shape: StadiumBorder(),
                                    foregroundColor: Colors.red),
                                child: Text(tDelete),
                              )
                            ],
                          ),
                        ],
                      ))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: Text("Something went wronge"),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
