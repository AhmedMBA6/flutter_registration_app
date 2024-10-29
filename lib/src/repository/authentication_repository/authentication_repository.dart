import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_registration_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:flutter_registration_app/src/features/core/screens/dashboard/dashboard.dart';
import 'package:flutter_registration_app/src/repository/authentication_repository/exception/signup_email_password_faliure.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = "".obs;

  @override
  void onReady() {
    Future.delayed(Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setIntialScreen);
  }

  _setIntialScreen(User? user) {
    user == null
        ? Get.offAll(() => WelcomeScreen())
        : Get.offAll(() => Dashboard());
  }

  Future<void> createUserWithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => Dashboard())
          : Get.to(() => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignupEmailPasswordFaliure.code(e.code);
      print('Firebase Auth Exception - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignupEmailPasswordFaliure();
      print('Exception - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginWithEmailandPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
// phone ver
  Future<void> phoneAuthentication(String phoneNu) async {
    await _auth.verifyPhoneNumber(
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      phoneNumber: phoneNu,
      verificationFailed: (e) {
        if (e.code == "invalid-phone-number") {
          Get.snackbar('Error', 'The provided phone number is not valid');
        } else {
           Get.snackbar('Error', 'Sonething went wrong, Try aagain');
        }
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
   var credentials =  await _auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationId.value, smsCode: otp));
        return credentials.user != null ? true : false;
  }
}
