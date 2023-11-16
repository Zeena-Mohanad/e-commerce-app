//import 'dart:convert';
import 'dart:convert';

import 'package:e_commerce_app/api/sign_up_api.dart';
import 'package:e_commerce_app/models/sign_up_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SignUpProvider extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  late SignUpBody dataApi;
  Future<void> postSignUp(SignUpBody body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await register(body))!;
    if (response.statusCode == 200) {
       dataApi = SignUpBody.fromJson(json.decode(response.body)['dataobj']);
      isBack = true;
    }
    loading = false;
    notifyListeners();
  }
}
