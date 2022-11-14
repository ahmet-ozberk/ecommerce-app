import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/utils/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

class AuthView extends ConsumerStatefulWidget {
  const AuthView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthViewState();
}

class _AuthViewState extends ConsumerState<AuthView> {
  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(Controllers.authController);
    final read = ref.read(Controllers.authController);
    return GrockKeyboardClose(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    "APP LOGO",
                    style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
                  ),
                ).size(height: context.height * 0.2),
                Expanded(
                  child: AnimatedCrossFade(
                    crossFadeState:
                        watch.authStatus == AuthStatus.login ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 300),
                    firstChild: AuthStatus.login.widget,
                    secondChild: AuthStatus.register.widget,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      watch.authStatus == AuthStatus.login ? "Hesabın var mı? Giriş Yap" : "Hesabın yok mu? Kayıt Ol",
                      style:
                          CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 10),
                    CupertinoSwitch(
                      value: watch.authStatus == AuthStatus.login ? true : false,
                      onChanged: (_) => read.authStatusChange(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
