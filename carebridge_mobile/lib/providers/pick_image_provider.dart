import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_rock_mobile/constants/app_colors.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

class ImageUploaderNotifier extends ChangeNotifier {
  File? image;
  List<String> imageUrl = [];

  Future<void> pickPicture(ImageSource source) async {
    try {
      XFile? imageFile = await ImagePicker().pickImage(source: source);
      if (imageFile == null) return;

      imageFile = await cropImage(imageFile);
      if (imageFile == null) return;

      final tempImage = File(imageFile.path);
      // final imageFromDevice = await saveImageToDevice(imageFile.path);

      image = tempImage;
      imageUrl.add(imageFile.path);
      // image = imageFromDevice;

      notifyListeners();
    } on PlatformException catch (exception) {
      print("Failed to get image: $exception");
    }
  }

  Future<XFile?> cropImage(XFile imageFile) async {
    // Crop the image using image_cropper package
    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: imageFile.path,
      maxWidth: 1080,
      maxHeight: 1920,
      compressQuality: 80,
      aspectRatioPresets: [CropAspectRatioPreset.ratio4x3],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Purple Care Mobile Cropper',
          toolbarColor: AppColors.carebridgePrimary,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.ratio4x3,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Purple Care Mobile Cropper',
        ),
      ],
    );

    if (croppedFile != null) {
      notifyListeners();
      return XFile(croppedFile.path);
    } else {
      return null;
    }
  }

  /// SAVE TAKEN IMAGE TO USER GALLERY
  // Future<File> saveImageToDevice(String imagePath) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final name = basename(imagePath);
  //   final image = File("${directory.path}/$name");
  //   return File(imagePath).copy(image.path);
  // }

  //  imageUpload() async {
  // REPLACE ${uid}jpg IN CHILD WITH USER ID INSTEAD SO THE IMAGE IS ALWAYS REPLACED AFTER AN UPLOAD
  //   final ref = FirebaseStorage.instance.ref().child('therock').child('${uid}jpg');
  // TO UPLOAD, FIREBASE STORAGE NEEDS A FILE NOT AN  XFILE
  //   await ref.putFile(image);
  //   imageDownloadUrl = await ref.getDownloadURL();
  // }
}
