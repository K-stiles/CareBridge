import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class ConsultationButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget icon;
  final Widget label;
  final Color borderColor;
  final Color background;
  const ConsultationButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.label,
    required this.borderColor,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.xl + 10,
          vertical: AppSizes.sm - 3,
        ),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(AppSizes.xs),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: AppSizes.md),
            label,
          ],
        ),
      ),
    );
  }
}
