import 'dart:convert';

import 'package:bingo_demo/const.dart';
import 'package:bingo_demo/models/login_data.dart';
import 'package:bingo_demo/models/orders_data.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Utlis {
  static Future<String> login(String email, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(URL + 'login'));
    request.body = json.encode({"username": email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var source = await response.stream.bytesToString();
      final loginData = loginDataFromJson(source);
      await savePref(email, password, loginData.token, loginData.userId);
      return "success";
    } else {
      return (response.reasonPhrase.toString());
    }
  }

  static savePref(
      String email, String password, String token, String userid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("email", email);
    preferences.setString("password", password);
    preferences.setString("userid", userid);
    preferences.setString("token", token);
  }

  static Future<dynamic> getProducts(String token, String userId) async {
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(URL + 'orders'));
    request.body = json.encode({"orderId": int.parse(userId)});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var source = await response.stream.bytesToString();
      final orderData = orderDataFromJson(source);
      return orderData.orders;
    } else {
      List<Order> emptyList = [];
      return emptyList;
    }
  }
}
