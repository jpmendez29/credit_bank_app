import 'dart:developer';

import 'package:credit_bank_app/pages/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:credit_bank_app/pages/register/usuarios_model.dart';

class prefs_controller extends GetxController {
  Future<void> storeUserInfo(email, pasw) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log(' usuario almacenado ${email} ${pasw}');
    await prefs.setBool("storedUser", true);
    await prefs.setString("email", email);
    await prefs.setString("pasw", pasw);
    await prefs.setString("usr", pasw);
  }

  Future<void> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log('obtener usuario');

    bool storedUser = await prefs.getBool("storedUser") ?? false;
    log('UserLocalSharedPrefs getUserInfo storedUser? <$storedUser>');

    if (storedUser) {
      var savedEmail = await prefs.getString("email") ?? "";
      var savedPassword = await prefs.getString("pasw") ?? "";
      log('UserLocalSharedPrefs getUserInfo <$savedEmail< <$savedPassword>');

      return Future.value(usuario_model(email: savedEmail, pasw: savedPassword, userProfile: UserProfile(id: "", name: "")));
    } else {
      log('UserLocalSharedPrefs getUserInfo no user');
      return Future.error("No user");
    }
  }

  Future<void> clearUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log('Limpiar informacion de usuario');
    await prefs.setString("email", "");
    await prefs.setString("pasw", "");
    await prefs.setBool("storedEmail", false);
  }

  Future<bool> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool('logged') ?? false;
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log('UserLocalSharedPrefs logout');
    await prefs.setBool("logged", false);
  }

  Future<bool> isStoringUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool("storedUser") ?? false;
  }

  deleteAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
