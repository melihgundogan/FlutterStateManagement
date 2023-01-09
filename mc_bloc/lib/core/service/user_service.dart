import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;
import 'package:http/http.dart' as http;
import 'package:mc_bloc/core/model/user_model.dart';

import '../extension/app_extension.dart';

typedef MyHttpClient = http.Client;

@immutable
class UserService {
  final MyHttpClient httpClient;
  UserService() : httpClient = MyHttpClient();

  Future<List<UserModel>> fetchUser(UserUrl url) async {
    final response = await httpClient.get(Uri.parse(url.urlToString));

    return (json.decode(response.body) as List<dynamic>)
        .map((dynamic user) => UserModel.fromJson(UserMap.from(user)))
        .cast<UserModel>()
        .toList();
  }
}
