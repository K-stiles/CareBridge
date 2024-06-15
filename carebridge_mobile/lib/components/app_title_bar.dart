import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class PurpleAppTitleBar extends StatelessWidget {
  final String title;

  const PurpleAppTitleBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: appWidth,
      height: appHeight * .15,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
          colors: <Color>[
            colorScheme.primary,
            colorScheme.primary,
            colorScheme.secondary.withOpacity(0.65),
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppSizes.lg),
          bottomRight: Radius.circular(AppSizes.lg),
        ),
        image: const DecorationImage(
          image: AssetImage(AppImages.homebg),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: AppSizes.xl),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Purple Care".toUpperCase(),
                  style: textTheme.headlineSmall!
                      .copyWith(color: Colors.white, fontSize: 14),
                ),
                Text(
                  title,
                  style: textTheme.headlineLarge!.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
