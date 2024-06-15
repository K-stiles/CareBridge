import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class ConstHistPopup extends StatelessWidget {
  const ConstHistPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void voiceCall() {
      Get.back();
    }

    void videoCall() {
      Navigator.pop(context);
      print("calling..........");
    }

    cancel() => Get.back();

    return AlertDialog(
      buttonPadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.all(AppSizes.base_),
      content: SizedBox(
        height: appHeight * .15,
        child: Column(
          children: [
            /** voice button  */
            TextButton(
              onPressed: voiceCall,
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 30),
                padding: const EdgeInsets.all(AppSizes.sm),
              ),
              child: Text("Voice",
                  style: textTheme.bodyLarge!.copyWith(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w500)),
            ),
            Divider(color: Colors.grey.shade500, height: AppSizes.base_),

            /** video button  */
            TextButton(
              onPressed: videoCall,
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 30),
                padding: const EdgeInsets.all(AppSizes.sm),
              ),
              child: Text(
                "Video",
                style: textTheme.bodyLarge!.copyWith(
                    color: Colors.grey.shade800, fontWeight: FontWeight.w500),
              ),
            ),
            Divider(color: Colors.grey.shade500, height: AppSizes.base_),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(bottom: AppSizes.sm),
      actions: [
        TextButton(
          onPressed: cancel,
          style: TextButton.styleFrom(
            minimumSize: const Size(double.infinity, 30),
            padding: const EdgeInsets.all(AppSizes.sm),
          ),
          child: Text("Cancel",
              style: textTheme.bodyLarge!.copyWith(
                  color: colorScheme.primary, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}
