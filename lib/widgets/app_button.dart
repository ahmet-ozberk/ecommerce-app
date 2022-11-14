import 'package:ecommerce/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const AppButton({Key? key, this.text = "Buton", this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GrockButton(
      color: AppColor.hardGreen,
      onTap: ()=> onPressed?.call(),
      child: Text(
        text,
        style: CupertinoTheme.of(context).textTheme.actionTextStyle.copyWith(color: AppColor.primary),
      ),
    );
  }
}
