import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/features/auth/data/models/user_model/user/user_model.dart';
import 'package:expense_tracker/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static Future<void> saveUserData(UserModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(model.toJson()));
  }

  static UserModel? getSavedUser({required BuildContext context}) {
    return context.read<UserCubit>().state.model;
  }

  static Future<String?> getDeviceId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("deviceId");
  }

  static Future<void> setDeviceId(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("deviceId", token);
  }

  static Future<String?> getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("lang");
  }

  static Future<void> setLang(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", lang);
  }

  static Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  static void clearSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static void clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
  }

  Future<void> setLastPath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastPathKey', path);
  }

  Future<String?> getLastPath() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('lastPathKey');
  }
}
