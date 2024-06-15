import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import '../constants/app_sizes.dart';
// import '../models/patient_model.dart';

class AppointmentCard extends StatelessWidget {
  final void Function()? onTap;

  const AppointmentCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.sm),
          decoration: BoxDecoration(
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(AppSizes.sm),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                child: ClipOval(
                  child: Image.network(
                    AppImages.doctor1,
                    width: AppSizes.xxl * 3,
                    height: AppSizes.xxxl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.base_),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New Appointment",
                          style: textTheme.displayMedium!
                              .copyWith(color: Colors.grey.shade800),
                        ),
                        Text(
                          "10mins",
                          style: textTheme.bodySmall!
                              .copyWith(color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.xs),
                    Text(
                      "Annette Black wants to have a video session with you Doctor",
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: textTheme.bodySmall!
                          .copyWith(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
