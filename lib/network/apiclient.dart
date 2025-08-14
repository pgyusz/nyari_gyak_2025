import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:nyari_gyak_2025/network/responses/api_base_response.dart';
import 'package:nyari_gyak_2025/network/responses/splash_response.dart';
import 'package:nyari_gyak_2025/network/responses/users_response.dart';

class ApiClient {
  ApiClient({required this.client});

  final http.Client client;
  final String url = 'https://nygy2025.aprdev.net/';

  // API nevek

  final String _splashPath = 'ma_splash.php';
  final String _setFavoritePath = 'ma_set_favorite.php';

  // Field nevek
  final String _udidField = 'udid';
  final String _uidField = 'uid';
  final String _courseIdField = 'courseID';

  Future<Map<String, dynamic>> _post({
    required String path,
    required Map<String, dynamic> arguments,
  }) async {
    http.Response response = await client.post(
      Uri.parse(url + path),
      body: arguments,
    );
    return jsonDecode(response.body)['response'];
  }

  Future<Map<String, dynamic>> _postMultipart({
    required String path,
    required Map<String, String> arguments,
    required List<http.MultipartFile> files,
  }) async {
    final String urla = '$url$path';
    final http.MultipartRequest multipartRequest =
        http.MultipartRequest('POST', Uri.parse(urla))
          ..fields.addAll(arguments)
          ..files.addAll(files);
    final http.StreamedResponse response = await multipartRequest.send();
    final String responseJsonString = utf8.decode(
      await response.stream.toBytes(),
    );
    return jsonDecode(responseJsonString)['response'];
  }

  // Future<UsersResponse> getUsers() async {
  //   final response = await _post(
  //     path: _usersPath,
  //     arguments: <String, String>{},
  //   );
  //   return UsersResponse.fromJson(response);
  // }

  Future<SplashResponse> callSplash(String udid) async {
    final response = await _post(
      path: _splashPath,
      arguments: <String, String>{_udidField: udid},
    );
    return SplashResponse.fromJson(response);
  }

  Future<ApiBaseResponse> callSetFavorite(
    String udid,
    String uid,
    String courseId,
  ) async {
    return ApiBaseResponse.fromJson(
      await _post(
        path: _setFavoritePath,
        arguments: <String, String>{
          _udidField: udid,
          _uidField: uid,
          _courseIdField: courseId,
        },
      ),
    );
  }
}
