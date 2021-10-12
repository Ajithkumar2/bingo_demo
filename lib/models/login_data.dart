import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

class LoginData {
  LoginData({
    required this.token,
    required this.userId,
  });

  String token;
  String userId;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        token: json["token"] ?? "null",
        userId: json["userId"] ?? "null",
      );
}
