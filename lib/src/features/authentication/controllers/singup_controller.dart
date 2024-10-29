import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class SingUpController extends GetxController {
  static SingUpController get instance => Get.find();

  //controllers to get data from formfield
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNu = TextEditingController();
// this function doing the rest , call from design
  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailandPassword(email, password);
  }

  // get the phone number from the user and pass it to auth
  void phoneAuthentication(String phoneNu){
    AuthenticationRepository.instance.phoneAuthentication(phoneNu);
  }
}
