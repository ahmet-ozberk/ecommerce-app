import 'package:ecommerce/view/base_view.dart';
import 'package:ecommerce/view/forgot_password_view.dart';
import 'package:ecommerce/widgets/app_button.dart';
import 'package:ecommerce/widgets/app_text_button.dart';
import 'package:ecommerce/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: 20.padding,
      margin: 20.padding,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: 20.borderRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppTextfield(
            labelText: "e-mail adresi",
            validator: (p0) {
              if (p0!.isEmail) {
                return "lütfen geçerli bir e-mail adresi giriniz";
              }
              return null;
            },
          ),
          20.height,
          AppTextfield(
            labelText: "şifre",
            isPassword: true,
            validator: (p0) {
              if (p0!.length < 6) {
                return "lütfen en az 6 karakter giriniz";
              }
              return null;
            },
          ),
          40.height,
          AppButton(
              text: "Giriş Yap",
              onPressed: () {
                Grock.toRemove(const BaseView());
              }),
          20.height,
          AppTextButton(
            firstText: "Şifreni mi unuttun?",
            secondText: "Hemen Sıfırla",
            onPressed: () {
              Grock.to(const ForgotPasswordView());
            },
          ),
        ],
      ),
    );
  }
}
