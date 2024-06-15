import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/screens/app/patient/profile_setup.dart';
// import 'package:the_rock_mobile/screens/app/profile_setup.dart';

import '../constants/app_images.dart';

class SubscriptionPopUp extends StatelessWidget {
  const SubscriptionPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    proceed() {
      Navigator.pop(context);
      Get.to(() => const ProfileSetup());
    }

    return AlertDialog(
      buttonPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.only(bottom: AppSizes.lg),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.md))),
      content: Container(
        height: 240,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.md),
            topRight: Radius.circular(AppSizes.md),
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
              "Subscribed",
              textAlign: TextAlign.center,
              style: textTheme.displayMedium,
            ),
            const SizedBox(height: AppSizes.base_),
            Text(
              "You have successfully subscribed to the Basic plan. Your subscription will renew on the 2023/07/06",
              textAlign: TextAlign.center,
              style: textTheme.bodySmall!.copyWith(color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
      actions: [
        Center(
          child: ElevatedButton(
              onPressed: proceed,
              style: ElevatedButton.styleFrom(minimumSize: const Size(80, 40)),
              child: const Text("Continue")),
        ),
      ],
    );
  }
}
