import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  List<dynamic> difData = [];

  Future<void> addMessage(String value) async {
    difData.add(value);
    notifyListeners();
  }

  void clearMessages() {
    difData.clear();
    notifyListeners();
  }

  Future<List<dynamic>> printMessage() async {
    return difData;
  }
}
