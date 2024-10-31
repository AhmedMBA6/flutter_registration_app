class UserModel {
  String? id;
   String fullName;
   String email;
   String phoneNu;
   String password;

    UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNu,
    required this.password,
   });

   toJson(){
    return {
      "FullName" : fullName,
      "Email" : email,
      "Phone" : phoneNu,
      "Password" : password
    };

   }
}