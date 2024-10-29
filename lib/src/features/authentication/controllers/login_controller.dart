import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();

  //textfield controllers to get data from textformfield
  final email = TextEditingController();
  final password = TextEditingController();

  // this function will do the rest
  void loginUser(String email, String password) {
    String? error =  AuthenticationRepository.instance.loginWithEmailandPassword(email, password) as String?;
    if(error != null){
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
  }
}