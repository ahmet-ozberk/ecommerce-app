import 'package:ecommerce/view/auth_view/auth_view.dart';
import 'package:ecommerce/view/auth_view/login_view.dart';
import 'package:ecommerce/widgets/app_button.dart';
import 'package:ecommerce/widgets/app_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_rounded),
              ),
            ),
            SizedBox(
              height: context.height * 0.28,
              child: Center(
                child: Text(
                  "APP LOGO",
                  style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
                ),
              ),
            ),
            Text(
              "E-Mail adresinizi girin ve mail adresinize gelen şifre sıfırlama linki ile şifrenizi sıfırlayın.",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ).paddingHorizontal(12),
            20.height,
            AppTextfield(
              labelText: "e-mail adresi",
              validator: (p0) {
                if (p0!.isEmail) {
                  return "lütfen geçerli bir e-mail adresi giriniz";
                }
                return null;
              },
            ),
            40.height,
            AppButton(
                text: "Şifremi Sıfırla",
                onPressed: () {
                  Grock.toRemove(const AuthView());
                }),
          ],
        ),
      )),
    );
  }
}
