import 'dart:developer';
import 'package:e_commerce_app/models/sign_up_body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:e_commerce_app/base_url.dart';
import 'dart:io';

Future<http.Response?> updateUser(SignUpBody data, String userId) async {
  String url = '$baseUrl/api/User/Update/$userId';
  final uri = Uri.parse(url);
  print(userId);
  http.Response? response;
  try {
    response = await http.put(uri,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(data.toJson()));
    log('Server returned status code ${response.statusCode}');
    if (response.statusCode != 200) {
      log('Server returned status code ${response.statusCode}');
    }
  } catch (e) {
    log(e.toString());
  }
  return response;
}
