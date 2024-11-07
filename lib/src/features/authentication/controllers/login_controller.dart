import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';
import 'package:flutter_registration_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter_registration_app/src/utils/helper/helper_controller.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();

  //textfield controllers to get data from textformfield
  final showPassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /// Loader
  final isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;

  /// [EmailAndPasswordLogin]
  Future<void> login() async{
    try {
      isLoading.value = true;
      if(!loginFormKey.currentState!.validate()){
        isLoading.value = false;
        return;
      }
      final auth = AuthenticationRepository.instance;
      await auth.loginWithEmailandPassword(email.text.trim(), password.text.trim());
      auth.setIntialScreen(auth.firebaseUser);
    } catch (e) {
      isLoading.value = false;
      Helper.errorSnackBar(title: tOnSnap, message: e.toString());
    }
  }

  /// [GoogleSignInAuthentication]
  Future<void> GoogleSignIn() async{
    try {
      isGoogleLoading.value = true;
      final auth = AuthenticationRepository.instance;
      await auth.signInWithGoogle();
      isGoogleLoading.value = false;
      auth.setIntialScreen(auth.firebaseUser);
    } catch (e) {
      isGoogleLoading.value = false;
      Helper.errorSnackBar(title: tOnSnap, message: e.toString());
    }
  }

  /// [FacebookSignInAuthentication]
  // Future<void> facebookSignIn() async{
  //   try {
  //     isFacebookLoading.value = true;
  //     await AuthenticationRepository.instance.signInWithFacebook();
  //     isFacebookLoading.value = false;
  //   } catch (e) {
  //     isFacebookLoading.value = false;
  //     Helper.errorSnackBar(title: tOnSnap, message: e.toString());
  //   }
  // }

  // this function will do the rest
  void loginUser(String email, String password) {
    String? error =  AuthenticationRepository.instance.loginWithEmailandPassword(email, password) as String?;
    if(error != null){
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
  }
}