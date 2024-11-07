import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_registration_app/src/features/authentication/screens/mail_verification/mail_verification.dart';
import 'package:flutter_registration_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:flutter_registration_app/src/features/core/screens/dashboard/dashboard.dart';
import 'package:flutter_registration_app/src/repository/authentication_repository/exception/exceptions.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> _firebaseUser;
  final _phoneVerificationId = "".obs;
  late final GoogleSignInAccount googleUser;

  // Getters
  User? get firebaseUser => _firebaseUser.value;
  String get getUserID => firebaseUser?.uid ?? "";
  String get getUserEmail => firebaseUser?.email ?? "";

// loads when app launch from main
  @override
  void onReady() {
    // Future.delayed(Duration(seconds: 6));
    _firebaseUser = Rx<User?>(_auth.currentUser);
    FlutterNativeSplash.remove();
    _firebaseUser.bindStream(_auth.userChanges());
    setIntialScreen(_firebaseUser.value);
    //ever(firebaseUser, _setIntialScreen);
  }

  // setting intial screen
  setIntialScreen(User? user) {
    user == null
        ? Get.offAll(() => WelcomeScreen())
        : user.emailVerified
            ? Get.offAll(() => Dashboard())
            : Get.offAll(
                () => MailVerification(),
              );
  }

  /* --------------------------Email & Password sign-in -------------------------*/

  /// [EmailAuthentication] - Login
  Future<void> loginWithEmailandPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (_) {}
  }

  /// [EmailAuthentication] - Register
  Future<void> createUserWithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _firebaseUser.value != null
          ? Get.offAll(() => Dashboard())
          : Get.to(() => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = TeamExceptions.fromCode(e.code);
      print('Firebase Auth Exception - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = TeamExceptions();
      print('Exception - ${ex.message}');
      throw ex;
    }
  }

  /// [EmailVerification] - Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final ex = TeamExceptions.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      const ex = TeamExceptions();
      throw ex.message;
    }
  }

/* -------------------------- Federated identity & social sign-in ------------------------*/

  /// [GoogleAuthentication] - Google
  Future<UserCredential> signInWithGoogle() async {

    try {
      // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the authentication details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once Signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
    }on FirebaseAuthException catch (e) {
      final ex = TeamExceptions.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      const ex = TeamExceptions();
      throw ex.message;
    }
  }

  /// [FacebookAuthentication] - Facebook
  //Future<UserCredential> signInWithFacebook() async {}

  /// [PhoneAuthentication] - Login
  loginWithPhoneNu(String phoneNumber) async {}

  /// [PhoneAuthentication] - Register
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
          Get.snackbar(
              'Error', 'Something went wrong, Try aagain ${e.message}');
        }
      },
      codeSent: (verificationId, resendToken) {
        _phoneVerificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _phoneVerificationId.value = verificationId;
      },
    );
  }

  /// [PhoneAuthentication] - Verify phone nu By OTP
  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: _phoneVerificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

/* ---------------------- ./end Federated identity & social sign-in -----------------------*/

  /// [LogoutUser] - Valid for any authentication
  Future<void> logout() async {
   try {
     await GoogleSignIn().signOut();
    // await FacebookAuth.instance.logOut();
     await FirebaseAuth.instance.signOut();
     Get.offAll(() => WelcomeScreen());
   }on FirebaseAuthException catch (e) {
     throw e.message!;
   }on FormatException catch (e) {
    throw e.message;
   } catch (e) {
    throw "Unable to logout. Try again";
   }
  }
}
