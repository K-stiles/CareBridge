import 'package:flutter/material.dart';
import 'package:the_rock_mobile/models/settings_options_model.dart';

import '../constants/app_sizes.dart';

class PatientAccountTile extends StatelessWidget {
  final SettingsOptions settingsOptions;
  final void Function()? onTap;

  const PatientAccountTile({
    super.key,
    required this.settingsOptions,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // const String shareMsg = "Share Purple Care App with your friends";
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      child: ListTile(
        title: Text(
          settingsOptions.title,
          style: textTheme.displaySmall!.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          settingsOptions.subtitle,
          style: textTheme.bodySmall!.copyWith(
            color: Colors.grey.shade500,
          ),
        ),
        leading: Container(
          height: double.infinity,
          width: 50,
          decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8)),
          child: settingsOptions.icon,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: colorScheme.primary.withOpacity(0.8),
          size: AppSizes.md,
        ),
        dense: true,
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
