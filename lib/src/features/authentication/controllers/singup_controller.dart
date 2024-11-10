import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/features/authentication/models/user_model.dart';
import 'package:flutter_registration_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter_registration_app/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class SingUpController extends GetxController {
  static SingUpController get instance => Get.find();
GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
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

  /// Loader
  final isLoading = false.obs;

  /// Register New User using either [EmailAndPassword] OR [PhoneNumber] authentication
  Future<void> createUser() async {
    try {
      isLoading.value = true;
      // if (!signupFormKey.currentState!.validate()) {
      //   isLoading.value = false;
      //   return;
      // }

      /// For Phone Authentication
      // SingUpController.instance.phoneAuthentication(controller.phoneNu.text.trim());
      // Get.to(() => OtpScreen());

      //Get User and Pass it to controller
      final user = UserModel(
        fullName: fullName.text.trim(),
        email: email.text.trim(),
        phoneNu: phoneNu.text.trim(),
        password: password.text.trim(),
      );

      // Authenticate User first

      final auth = AuthenticationRepository.instance;
      await auth.createUserWithEmailandPassword(user.email, user.password);
      await UserRepository.instance.createUser(user);
      auth.setIntialScreen(auth.firebaseUser);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 5));
    }
  }

  /// [PhoneNuAuthentication]
  Future<void> phoneAuthentication (String phoneNu) async{
    try {
      await AuthenticationRepository.instance.phoneAuthentication(phoneNu);
    } catch (e) {
      throw e.toString();
    }
  }
}
