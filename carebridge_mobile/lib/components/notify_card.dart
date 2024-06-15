import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/exports.dart';
import 'package:the_rock_mobile/models/notifications.dart';

class NotifyCard extends StatelessWidget {
  final void Function()? onTap;
  final Notifier notify;
  final Color readColor;

  const NotifyCard({
    super.key,
    required this.onTap,
    required this.readColor,
    required this.notify,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSizes.sm),
        decoration: BoxDecoration(
          color: readColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
          child: Row(
            children: [
              // avatar
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.network(
                    notify.image,
                    width: AppSizes.xxl * 3,
                    height: AppSizes.xxxl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 15),

              //doc info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notify.title,
                    style: textTheme.displaySmall!
                        .copyWith(color: colorScheme.primary),
                  ),
                  const SizedBox(
                    height: AppSizes.xs,
                  ),
                  Text(
                    notify.body,
                    style: textTheme.bodySmall!
                        .copyWith(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
