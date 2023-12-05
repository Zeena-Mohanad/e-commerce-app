import 'dart:developer';
import 'package:e_commerce_app/Provider/log_in_provider.dart';
import 'package:e_commerce_app/models/sign_up_body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:e_commerce_app/base_url.dart';
import 'dart:io';

Future<http.Response?> updateUser(SignUpBody data) async {
  var logInProvider = LogInProvider();
  String url = '$baseUrl/User/Update/${logInProvider.userData.id}';
  final uri = Uri.parse(url);
  http.Response? response;
  try {
    response = await http.put(uri,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(data.toJson()));
    print(response.statusCode);
  } catch (e) {
    log(e.toString());
  }
  return response;
}
