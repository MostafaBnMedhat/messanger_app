import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:randomusers/models/user_model.dart';

class UserService {
  static Dio dio = Dio();

  static Future<UserModel> getData() async {
    Response response = await dio.get('https://randomuser.me/api/?results=5');
    if (kDebugMode) {
      print('Response data: ${response.data}');
    }
    return UserModel.fetchData(response.data);
  }
}
