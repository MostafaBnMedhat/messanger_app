import 'package:flutter/foundation.dart';

class UserModel {
  List<dynamic> result;

  UserModel({required this.result});

  factory UserModel.fetchData(Map<String, dynamic> json) {
    // Safely fetch only available users, limited by the length of the 'results' array.

    List<dynamic> fullData = [];

    for (var i = 0; i < 5; i++) {
      fullData.add(json["results"][i]);
    // 0 , 1, 2,3,4
    }



    // Map user data for display
    fullData = fullData.map(
            (user) {
      return {
        "name": user["name"]["first"] + " " + user["name"]["last"],
        "email": user["email"],
        "image": user["picture"]["thumbnail"],
      };
    }).toList();

    return UserModel(result: fullData);
  }
}
