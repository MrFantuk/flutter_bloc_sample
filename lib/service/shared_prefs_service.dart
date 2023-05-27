// import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceKeys {
  static const textColorModelKey = "text_color_model_json";
  static const textColorModelTitleKey = "text_color_model_title";
  static const textColorModelColorKey = "text_color_model_color";
}

class SharedPreferenceService {
  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async => instance = await SharedPreferences.getInstance();

  static String getTextColorModel(String key) {
    return instance.getString(key) ?? '';
  }

  static Future<bool> setTextColorModel(String json) async {
    return instance.setString(PreferenceKeys.textColorModelKey, json);
  }

  static String getString(String key) {
    return instance.getString(key) ?? '';
  }

  static bool getBool(String key) {
    return instance.getBool(key) ?? false;
  }

  static int getColorValue(String key) {
    return instance.getInt(key) ?? Colors.blue.value;
  }

  static Future<bool> setBool(String key, bool value) {
    return instance.setBool(key, value);
  }

  static String getCustomList(String key) {
    return instance.getString(key) ?? '[]';
  }

  static Future<bool> setString(String key, String value) async {
    return instance.setString(key, value);
  }

  static Future<bool> setColorValue(String key, int value) async {
    return instance.setInt(key, value);
  }
}
