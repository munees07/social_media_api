// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/models/auth_model.dart';
import 'package:dio/dio.dart';

class AuthService {
  Dio dio = Dio();
  Future<UserModel?> signUp(AuthModel authModel) async {
    try {
      final response = await dio.post(
          'https://socialmedia-api-v1.onrender.com/auth/register',
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: authModel.toJson());

      if (response.statusCode == 201) {
        log('account created');
        print(response.data);

        final jsonData = UserModel.fromJson(response.data);
        return jsonData;
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }

  Future<String> login(AuthModel authModel) async {
    try {
      final response = await dio.post(
          'https://socialmedia-api-v1.onrender.com/auth/login',
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: authModel.toJson());

      if (response.statusCode == 200) {
        log('login success');
        final jsonData = response.data as Map<String, dynamic>;
        String token = jsonData['token'];
        String status = jsonData['status'];
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('Token', token);
        pref.setString('Status', status);
        return status;
      } else {
        throw Exception('user not found ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }

  Future<void> changePassword(String password) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('Token');
    final data = {'password': password};
    try {
      final response = await dio.post(
          'https://socialmedia-api-v1.onrender.com/auth/changepassword',
          data: jsonEncode(data),
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          }));

      if (response.statusCode == 200) {
        log('password changed');
      } else {
        print('password change faile${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserModel?> getLoggedUser() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('Token');
      final response = await dio.get(
        'https://socialmedia-api-v1.onrender.com/auth/loggeduser',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print(response.data);

      if (response.statusCode == 200) {
        final jsonData = UserModel.fromJson(response.data);
        return jsonData;
      } else {
        throw Exception('Failed to get logged-in user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Something went wrong: $e');
    }
  }
}
