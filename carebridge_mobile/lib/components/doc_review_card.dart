import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

import '../constants/app_images.dart';

class DocReviewCard extends StatelessWidget {
  const DocReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.base_, vertical: AppSizes.sm),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.base_),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            child: ClipOval(
              child: Image.asset(
                AppImages.logo,
                width: AppSizes.xxl * 3,
                height: AppSizes.xxxl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: AppSizes.sm),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Linda Fray",
                style: textTheme.displaySmall,
              ),
              const SizedBox(height: AppSizes.xs),
              Text(
                "Accra, Ghana",
                style:
                    textTheme.bodySmall!.copyWith(color: Colors.grey.shade600),
              ),
              const SizedBox(height: AppSizes.base_),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr Jenny is amazing. She was so helpful and ",
                    // maxLines: 2,
                    // overflow: TextOverflow.clip,
                    style: textTheme.bodySmall!
                        .copyWith(color: Colors.grey.shade700),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.xs),
              Text(
                "kind",
                style:
                    textTheme.bodySmall!.copyWith(color: Colors.grey.shade700),
              ),
              const SizedBox(height: AppSizes.sm),
            ],
          ),
        ],
      ),
    );
  }
}
