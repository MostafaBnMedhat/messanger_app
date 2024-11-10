import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:randomusers/models/user_model.dart';
import 'package:randomusers/services/user_service.dart';
class UserProvider with ChangeNotifier {


  UserModel? data;

  Future<void> getUsers() async {
    data = await UserService.getData();
    notifyListeners();
  }
}
