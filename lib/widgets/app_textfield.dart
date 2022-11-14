import 'package:ecommerce/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class AppTextfield extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? labelText;
  final int? maxLines;
  final Widget? leading;
  final Widget? trailing;
  final bool isPassword;
  final bool isFilled;
  final Color fillColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function()? onTap;
  final double borderRadius;
  final String? Function(String?)? validator;
  const AppTextfield(
      {Key? key,
      this.hintText,
      this.labelText,
      this.controller,
      this.maxLines = 1,
      this.leading,
      this.trailing,
      this.keyboardType,
      this.textInputAction,
      this.isPassword = false,
      this.isFilled = true,
      this.onTap,
      this.fillColor = Colors.white,
      this.borderRadius = 12,this.validator})
      : super(key: key);

  @override
  State<AppTextfield> createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: TextFormField(
        cursorColor: AppColor.orange,
        controller: widget.controller,
        maxLines: widget.maxLines,
        onTap: widget.onTap?.call(),
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        obscureText: widget.isPassword ? isVisible : false,
        //style: AppTextStyle.textField(context),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          //hintStyle: AppTextStyle.hintField(context),
          border: border(),
          labelText: widget.labelText,
          labelStyle: const TextStyle(color: AppColor.hardGreen),
          enabledBorder: border(),
          focusedBorder: focusBorder(),
          filled: widget.isFilled,
          fillColor: widget.fillColor,
          prefixIcon: widget.leading,
          contentPadding: [12, 10].horizontalAndVerticalP,
          suffixIcon: widget.isPassword
              ? CupertinoButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Icon(
                    isVisible ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                    color: Colors.black54,
                    size: 18,
                  ),
                )
              : widget.trailing,
        ),
      ),
    );
  }

  OutlineInputBorder focusBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: const BorderSide(
        color: AppColor.primary,
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: const BorderSide(color: AppColor.primary, width: 1),
    );
  }
}
