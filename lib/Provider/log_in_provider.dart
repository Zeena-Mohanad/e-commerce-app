import 'dart:convert';

import 'package:e_commerce_app/api/log_in_api.dart';
import 'package:e_commerce_app/api/update_user_api.dart';
import 'package:e_commerce_app/models/log_in_body.dart';
import 'package:e_commerce_app/models/sign_up_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogInProvider extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  late SignUpBody userData;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> postLogIn(LogInBody body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await logIn(body))!;
    if (response.statusCode == 200) {
      userData = SignUpBody.fromJson(json.decode(response.body)['dataobj']);
      isBack = true;

      saveUserData(userData.id!, userData.name!, userData.email!,
          userData.password!, userData.phone!);
    }
    loading = false;
    notifyListeners();
  }

  Future<void> putUser(SignUpBody body)async{
    loading = true;
    notifyListeners();
    http.Response response = (await updateUser(body))!;
    if (response.statusCode == 200) {
      userData = SignUpBody.fromJson(json.decode(response.body)['dataobj']);
      isBack = true;

      saveUserData(userData.id!, userData.name!, userData.email!,
          userData.password!, userData.phone!);
    }
    loading = false;
    notifyListeners();
  }

  Future<void> saveUserData(String id, String name, String email,
      String password, String phone) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('_id', id);
    prefs.setString('email', email);
    prefs.setString('password', password);
    prefs.setString('name', name);
    prefs.setString('phone', phone);
    prefs.setBool('isLoggedIn', true);
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('_id');
    prefs.remove('email');
    prefs.remove('password');
    prefs.remove('name');
    prefs.remove('phone');
    prefs.setBool('isLoggedIn', false);
    isBack = false;
  }

  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
