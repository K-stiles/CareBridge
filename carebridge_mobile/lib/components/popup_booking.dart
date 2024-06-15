import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/screens/app/patient/app.dart';

import '../constants/app_images.dart';

class BookingPopUp extends StatelessWidget {
  const BookingPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      buttonPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.symmetric(vertical: 10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Container(
        height: 240,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        padding: const EdgeInsets.only(
          left: AppSizes.md,
          right: AppSizes.md,
          top: AppSizes.md,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              height: 80,
              AppImages.card_pos,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: AppSizes.sm),
            Text(
              "Completed",
              textAlign: TextAlign.center,
              style: textTheme.displayMedium,
            ),
            const SizedBox(height: AppSizes.base_),
            Text(
              "Your appointment is successfully submitted. Dr. Leslie Alexander will confirm availability. Keep an eye on your notifications for confirmation.",
              textAlign: TextAlign.center,
              style:
                  textTheme.bodyMedium!.copyWith(color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
      actions: [
        Center(
          child: ElevatedButton(
              onPressed: () {
                Get.back();
                // Get.to(() => const App());
              },
              style: ElevatedButton.styleFrom(minimumSize: const Size(80, 40)),
              child: const Text("Back to home ")),
        ),
      ],
    );
  }
}
