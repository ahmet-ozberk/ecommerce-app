import 'package:ecommerce/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class AppTextButton extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Function()? onPressed;

  const AppTextButton({Key? key, this.firstText = "", this.secondText = "", this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            firstText,
            style: const TextStyle(fontSize: 14),
          ),
          CupertinoButton(
            onPressed: onPressed,
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              secondText,
              style: const TextStyle(color: AppColor.orange, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
