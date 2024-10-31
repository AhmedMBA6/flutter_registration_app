import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/features/authentication/models/user_model.dart';
import 'package:flutter_registration_app/src/features/authentication/screens/forgot_password/forgot_password_otp/otp_screen.dart';
import 'package:flutter_registration_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter_registration_app/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class SingUpController extends GetxController {
  static SingUpController get instance => Get.find();

  //controllers to get data from formfield
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNu = TextEditingController();

  final userRepo = Get.put(UserRepository());
// this function doing the rest , call from design
  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailandPassword(email, password);
  }

  Future<void> createUser(UserModel user) async{
   await userRepo.createUser(user);
    phoneAuthentication(user.phoneNu);
    Get.to(() => OtpScreen());
  }

  // get the phone number from the user and pass it to auth
  void phoneAuthentication(String phoneNu){
    AuthenticationRepository.instance.phoneAuthentication(phoneNu);
  }
}
