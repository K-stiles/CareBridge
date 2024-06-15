import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class PurpleAppBar extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget child;
  final bool showTitle;

  const PurpleAppBar({
    super.key,
    this.borderRadius = AppSizes.lg,
    this.width = double.infinity,
    this.height = AppSizes.xxl,
    required this.child,
    this.padding,
    this.showTitle = false,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
          colors: <Color>[
            colorScheme.primary,
            colorScheme.primary.withOpacity(0.75),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
        image: const DecorationImage(
          image: AssetImage(AppImages.homebg),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            showTitle
                ? Text(
                    "Purple Care".toUpperCase(),
                    style: textTheme.headlineSmall!
                        .copyWith(color: Colors.white, fontSize: 16),
                  )
                : const Text(""),
            child,
          ],
        ),
      ),
    );
  }
}
// ChangeThemeButtonWidget()