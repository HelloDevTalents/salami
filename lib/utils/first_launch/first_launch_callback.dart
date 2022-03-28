import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WrongTypeException implements Exception {}

class OnFirstLaunch {
  static const firstLaunch = 'first-launch-bool';

  static Future<void> execute(VoidCallback callback) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final x = prefs.getBool(firstLaunch);
      if (x == null) {
        await prefs.setBool(firstLaunch, false);
        callback();
      }
    } catch (_) {
      /// If this Exception is somehow thrown you've propably used
      /// [firstLaunch] key in different place
      throw WrongTypeException();
    }
  }
}
