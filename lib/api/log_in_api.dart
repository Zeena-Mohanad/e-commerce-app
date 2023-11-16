import 'dart:developer';
import 'package:e_commerce_app/models/log_in_body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:e_commerce_app/base_url.dart';
import 'dart:io';

  Future<http.Response?> logIn(LogInBody data) async {
    String url = '$baseUrl/api/login';
    final uri = Uri.parse(url);
    http.Response? response;
    try {
      response = await http.post(uri,
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
