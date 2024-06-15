import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class PickDateTime extends StatelessWidget {
  final String dateTime;
  final SvgPicture icon;
  final void Function()? onTap;
  final double inputWidth;
  final double inputHeight;

  const PickDateTime({
    super.key,
    required this.dateTime,
    required this.icon,
    required this.onTap,
    this.inputHeight = 50,
    this.inputWidth = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: inputHeight,
        width: inputWidth,
        padding: const EdgeInsets.only(right: AppSizes.base_),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.xs),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            /// ICON WRAPPER
            Container(
              height: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.base_),
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.xs),
                  bottomLeft: Radius.circular(AppSizes.xs),
                ),
              ),
              child: icon,
            ),

            const SizedBox(width: AppSizes.xs),
            Text(
              dateTime,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
