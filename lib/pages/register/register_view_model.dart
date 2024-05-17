import 'package:flutter/material.dart';

import '../../base/base_view_model.dart';
import '../../services/auth_service.dart';

class RegisterViewModel extends BaseViewModel {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerMailAddress = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  ValueNotifier<bool> isRegister = ValueNotifier(false);

  bool isEmpty() =>
      controllerName.text.isNotEmpty &&
          controllerMailAddress.text.isNotEmpty &&
          controllerPassword.text.isNotEmpty;

  Future<void> register() async {
    if (isEmpty()) {
      isRegister.value = await AuthService().signUp(
        email: controllerMailAddress.text,
        password: controllerPassword.text,
        userName: controllerName.text,
      );
    }
  }
}