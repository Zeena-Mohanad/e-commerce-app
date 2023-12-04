import 'dart:convert';
import 'package:e_commerce_app/api/sign_up_api.dart';
import 'package:e_commerce_app/models/sign_up_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUpProvider extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  late SignUpBody dataApi;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> postSignUp(SignUpBody body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await register(body))!;
    if (response.statusCode == 200) {
      dataApi = SignUpBody.fromJson(json.decode(response.body)['dataobj']);
      isBack = true;

      // Save user data to SharedPreferences on successful sign-up
      saveUserData(dataApi.name!,dataApi.email!, dataApi.password!,dataApi.phone!);
    }
    loading = false;
    notifyListeners();
  }

  Future<void> saveUserData(
      String name, String email, String password, String phone) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('email', email);
    prefs.setString('password', password);
    prefs.setString('name', name);
    prefs.setString('phone', phone);
  }
}
