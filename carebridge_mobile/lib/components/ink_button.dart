import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/app_colors.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class InkButton extends StatelessWidget {
  final void Function()? onTap;
  final double width;
  final double height;
  final double borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? background;
  final Color? iconColor;
  final Color? borderColor;
  final double? borderWidth;
  final Widget? child;

  const InkButton({
    super.key,
    required this.onTap,
    this.width = AppSizes.xl,
    this.height = AppSizes.xl,
    this.margin = const EdgeInsets.only(left: AppSizes.xs),
    this.background = AppColors.carebridgePrimary,
    this.borderRadius = AppSizes.md,
    this.borderColor,
    this.borderWidth,
    this.padding,
    this.iconColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 1.0,
          ),
        ),
        child: Center(
          child: child ??
              Icon(
                Icons.arrow_back,
                color: iconColor ?? colorScheme.background,
              ),
        ),
      ),
    );
  }
}
