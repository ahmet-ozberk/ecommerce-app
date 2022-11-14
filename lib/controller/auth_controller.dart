import 'dart:io';

import 'package:ecommerce/services/image_picker_services.dart';
import 'package:ecommerce/view/auth_view/login_view.dart';
import 'package:ecommerce/view/auth_view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends ChangeNotifier {
  AuthStatus _authStatus = AuthStatus.login;

  AuthStatus get authStatus => _authStatus;

  void authStatusChange() {
    _authStatus = _authStatus == AuthStatus.login ? AuthStatus.register : AuthStatus.login;
    notifyListeners();
  }

  File? selectedImage;
  void openImageSelected(ImageSource type) {
    ImagePickerService().getImage(type).then((value) {
      if (value != null) {
        selectedImage = value;
        notifyListeners();
      }
    });
  }
}

enum AuthStatus {
  login(LoginView()),
  register(RegisterView());

  final Widget widget;
  const AuthStatus(this.widget);
}
