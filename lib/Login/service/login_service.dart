// ignore_for_file: unused_field, prefer_final_fields, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teve/Login/models/login_model.dart';
import 'package:teve/Login/models/session_model.dart';
import 'package:teve/Utils/teve_theme.dart';
import 'package:teve/common/api.dart';

class LoginService {
  ApiService _service = ApiService();

  Future<dynamic> loginUser(
      {required LoginModel model, required BuildContext context}) async {
    String endpoint = "login/";
    var response =
        await _service.postData(endpoint, model.toJson(), isDb: true);
    if (response.isLeft) {
      return TeveTheme.moveToErrorPage(
          context: context, text: response.left.message!);
    } else {
      SessionModel token = SessionModel.fromJson(response.right);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('session', token.accessToken!);
      return token;
    }
  }
}
