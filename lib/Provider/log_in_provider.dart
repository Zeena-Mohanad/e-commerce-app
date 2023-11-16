import 'package:e_commerce_app/api/log_in_api.dart';
import 'package:e_commerce_app/models/log_in_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LogInProvider extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  Future<void> postLogIn(LogInBody body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await logIn(body))!;
    if (response.statusCode == 200) {
      isBack = true;
    }
    loading = false;
    notifyListeners();
  }
}