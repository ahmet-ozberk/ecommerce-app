import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/controller/base_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Controllers {
  static final authController = ChangeNotifierProvider((ref) => AuthController());
  static final baseController = ChangeNotifierProvider((ref) => BaseController());
}