import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:nyari_gyak_2025/network/apiclient.dart';
import 'package:nyari_gyak_2025/network/responses/user_model.dart';

class UserData extends ChangeNotifier {
  final ApiClient apiClient;
  String id = '';
  String name = '';

  late List<CameraDescription> cameras = [];

  UserData({required this.apiClient});

  Future<String> getUserData() async {
    try {
      final response = await apiClient.getUsers();
      if (response.success != '0') {
        UserModel user = response.users.first;
        id = user.id;
        name = user.name;
        return 'all_good';
      }
      return 'something_went_wrong';
    } catch (e) {
      return e.toString();
    }
  }
}
