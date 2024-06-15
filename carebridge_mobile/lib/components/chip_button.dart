import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class ChipButton extends StatelessWidget {
  final String chip;
  final void Function()? onTap;
  const ChipButton({super.key, required this.chip, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        // width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: BorderRadius.circular(AppSizes.xs),
          border: Border.all(
            color: Colors.grey.shade400,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(chip, style: textTheme.bodyMedium),
        ),
      ),
    );
  }
}
