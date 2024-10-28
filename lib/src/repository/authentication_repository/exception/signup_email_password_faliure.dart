class SignupEmailPasswordFaliure {
  final String message;

  const SignupEmailPasswordFaliure([this.message = "An Unknown error occured"]);

  factory SignupEmailPasswordFaliure.code(String code) {
    switch (code) {
      case "weak-password":
        return const SignupEmailPasswordFaliure("Please Enter a stronger password");
      case "invalid-email":
        return const SignupEmailPasswordFaliure(
            "Email is not Valid or badly formatted");
      case "email-already_in_use":
        return const SignupEmailPasswordFaliure(
            "An account already exists for that email");
      case "operation-not-allowed":
        return const SignupEmailPasswordFaliure(
            "Opretion is not allowed, please contact support.");
      case "user-disabled":
        return const SignupEmailPasswordFaliure(
            "this user has been disabled. please contact support for help");
      default:
        return const SignupEmailPasswordFaliure();
    }
  }
}
