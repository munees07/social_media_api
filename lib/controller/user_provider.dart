import 'package:flutter/material.dart';
import 'package:social_media/models/usersmodel.dart';
import 'package:social_media/services/user_services.dart';

class UserProvider extends ChangeNotifier {
  List<UsersModel> users = [];

  Future<void> fetchUsers(BuildContext context) async {
    try {
      final response = await UserService.fetchAllUsers();
      if (response.isEmpty) {
        throw Exception('Failed to fetch data');
      }
      users = response;
    } catch (e) {
      Center(
        child: Text('Error:$e'),
      );
    }
    notifyListeners();
  }
}
