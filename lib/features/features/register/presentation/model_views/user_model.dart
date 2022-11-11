class UserModel {
  final String email;
  final String passward;
  final String user_Id;

  UserModel(
      {required this.email, required this.passward, required this.user_Id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        user_Id: json['uId'], email: json["email"], passward: json["password"]);
  }

  Map<String, dynamic> toJson() {
    return {"email": email, "password": passward, "uId": user_Id};
  }
}
