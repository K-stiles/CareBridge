import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const ChangeThemeButtonWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;
    // final textTheme = Theme.of(context).textTheme;

    return SwitchListTile.adaptive(
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: colorScheme.primary),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade600,
        ),
      ),
      value: true,
      // value: themeProvider.isDarkMode,
      onChanged: (value) {
        // final provider = Provider.of<ThemeProvider>(context, listen: false);
        // provider.toggleTheme(value);
      },
      activeTrackColor: colorScheme.primary,
      activeColor: colorScheme.primary,
      secondary: Container(
        height: double.infinity,
        width: 55,
        decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppSizes.base_)),
        child: Icon(Icons.phone_android, color: colorScheme.primary),
      ),
    );
  }
}
