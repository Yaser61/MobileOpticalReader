import 'package:flutter/material.dart';
import 'package:mobile_optical_reader/services/auth_service.dart';

import '../../base/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController controllerMailAddress = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  ValueNotifier<bool> isLogin = ValueNotifier(false);

  bool isEmpty() => controllerMailAddress.text.isNotEmpty && controllerPassword.text.isNotEmpty;

  Future<void> login() async {
    if (isEmpty()) {
      isLogin.value = await AuthService()
          .sigIn(email: controllerMailAddress.text, password: controllerPassword.text);
    }
  }
}