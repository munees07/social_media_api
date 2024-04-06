import 'dart:convert';
import 'dart:developer';

import 'package:social_media/models/signup_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<SignupModel?> signUp(
      {String? email, String? password, String? username}) async {
    try {
      final response = await http.post(
          Uri.parse('https://socialmedia-api-v1.onrender.com/auth/register'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(
              {"email": email, "password": password, "username": username}));

      if (response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        log('account created');
        print(response.body);
        return SignupModel.fromJson(jsonData);
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }

}
