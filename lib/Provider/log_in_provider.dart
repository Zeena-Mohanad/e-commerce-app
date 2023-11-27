import 'package:e_commerce_app/api/log_in_api.dart';
import 'package:e_commerce_app/models/log_in_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogInProvider extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> postLogIn(LogInBody body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await logIn(body))!;
    if (response.statusCode == 200) {
      isBack = true;
      saveUserData(body.email, body.password);
    }
    loading = false;
    notifyListeners();
  }

  Future<void> saveUserData(String email, String password) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('email', email);
    prefs.setString('password', password);
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('email');
    prefs.remove('password');
    // Add any other data you want to clear on logout
  }
}
