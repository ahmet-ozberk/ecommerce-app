import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<File?> getImage(ImageSource type) async {
    File? selectedImage;
    final image = await ImagePicker().pickImage(source: type);
    if (image != null) {
      selectedImage = File(image.path);
    }
    return selectedImage;
  }
}