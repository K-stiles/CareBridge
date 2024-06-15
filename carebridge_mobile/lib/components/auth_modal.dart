import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:the_rock_mobile/constants/app_colors.dart';
import 'package:the_rock_mobile/providers/pick_image_provider.dart';

class AuthModal extends StatefulWidget {
  const AuthModal({super.key});

  @override
  State<AuthModal> createState() => _AuthModalState();
}

class _AuthModalState extends State<AuthModal> {
  // image != null
  // ? Image.file(image!, width:250, height:250, fit:BoxFit.cover)
  // : Image.network("url")

  @override
  Widget build(BuildContext context) {
    final imageUploader = Provider.of<ImageUploaderNotifier>(context);
    //  final navigator =  Navigator.of(context);
    return SizedBox(
        height: 250,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //label
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                "Profile Picture",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.carebridgePrimary,
                ),
              ),
            ),

            //take photo
            ListTile(
              leading: const Icon(
                Icons.photo_camera,
                color: AppColors.carebridgePrimary,
              ),
              title: const Text("Take Photo"),
              onTap: () {
                imageUploader.pickPicture(ImageSource.camera);
                Get.back();
                //  navigator.pop();
              },
            ),

            //select image
            ListTile(
              leading: const Icon(
                Icons.image,
                color: AppColors.carebridgePrimary,
              ),
              title: const Text("Select a picture from your photos"),
              onTap: () {
                imageUploader.pickPicture(ImageSource.gallery);
                Get.back();
                // navigator.pop();
              },
            )
          ],
        ));
  }
}
