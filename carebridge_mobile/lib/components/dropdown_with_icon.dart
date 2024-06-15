import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class DropSelectionWithIcon extends StatelessWidget {
  final SvgPicture svg;
  final Widget child;

  const DropSelectionWithIcon({
    super.key,
    required this.svg,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
        // height: 75,
        height: 50,
        padding: const EdgeInsets.only(right: AppSizes.base_),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.xs),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child:

            /// DEFAULT DROP DOWN
            Row(
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
              child: svg,
            ),

            const SizedBox(width: AppSizes.xs),

            /// DROP BUTTON
            Expanded(child: child),
          ],
        ));
  }
}
