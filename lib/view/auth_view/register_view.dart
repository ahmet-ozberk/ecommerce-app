import 'package:ecommerce/utils/controllers.dart';
import 'package:ecommerce/view/base_view.dart';
import 'package:ecommerce/widgets/app_button.dart';
import 'package:ecommerce/widgets/app_text_button.dart';
import 'package:ecommerce/widgets/app_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:image_picker/image_picker.dart';

class RegisterView extends ConsumerWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch = ref.watch(Controllers.authController);
    final read = ref.read(Controllers.authController);
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
          margin: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
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
                labelText: "isim soyisim",
                validator: (p0) {
                  if (p0!.length < 3) {
                    return "lütfen en az 3 karakter giriniz";
                  }
                  return null;
                },
              ),
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
                  text: "Kayıt Ol",
                  onPressed: () {
                    Grock.toRemove(const BaseView());
                  }),
              20.height,
              AppTextButton(
                firstText: "Şifreni mi unuttun?",
                secondText: "Hemen Sıfırla",
                onPressed: () {},
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 40,
          child: GrockMenu(
            width: context.width * 0.55,
            items: [
              GrockMenuItem(
                text: "Kameradan",
                trailing: const Icon(CupertinoIcons.camera_fill),
                onTap: () => read.openImageSelected(ImageSource.camera),
              ),
              GrockMenuItem(
                text: "Galeriden",
                trailing: const Icon(CupertinoIcons.photo_fill_on_rectangle_fill),
                onTap: () => read.openImageSelected(ImageSource.gallery),
              ),
            ],
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: 20.borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: 20.borderRadius,
                child: watch.selectedImage == null
                    ? const Icon(CupertinoIcons.add_circled_solid, size: 40, color: Colors.grey)
                    : Image.file(
                        watch.selectedImage!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
