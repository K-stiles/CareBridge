import 'package:flutter/material.dart';
import 'package:the_rock_mobile/models/response/appointment_model.dart';
import '../constants/app_images.dart';
import '../constants/app_sizes.dart';

class ConstHisCard extends StatelessWidget {
  final Appointment card;
  final void Function()? onTap;

  const ConstHisCard({super.key, required this.onTap, required this.card});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

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
                backgroundColor: colorScheme.primary.withOpacity(0.1),
                radius: 22,
                child: ClipOval(
                  child: Image.asset(
                    AppImages.logo,
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
                          card.patient.fullname,
                          style: textTheme.displayMedium!
                              .copyWith(color: Colors.grey.shade800),
                        ),
                        Text(
                          "5:50pm",
                          style: textTheme.bodySmall!
                              .copyWith(color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.xs),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone_in_talk_outlined,
                          size: AppSizes.sm + 3,
                        ),
                        const SizedBox(width: AppSizes.xs),
                        Text(
                          "Incominng call",
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: textTheme.bodySmall!
                              .copyWith(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
