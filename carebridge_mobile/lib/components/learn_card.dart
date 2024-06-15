import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import '../models/learn_model.dart';

class LearnCard extends StatelessWidget {
  final Learn learn;
  final void Function()? onTap;
  const LearnCard({super.key, required this.onTap, required this.learn});

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: appWidth * .8,
        decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: BorderRadius.circular(AppSizes.xs),
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.xs),
              child: Image.network(
                learn.image,
                height: double.infinity,
                width: appWidth * .25,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: AppSizes.base_),

            //  column here...
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Padding(
                    padding: const EdgeInsets.only(top: AppSizes.base_),
                    child: Text(learn.title, style: textTheme.displaySmall),
                  ),

                  const SizedBox(height: AppSizes.base_),

                  /// DESC
                  Text(
                    learn.message,
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(height: AppSizes.base_),

                  /// READ MORE
                  Padding(
                    padding: const EdgeInsets.only(right: AppSizes.md),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Read more",
                          style: textTheme.bodySmall!
                              .copyWith(color: colorScheme.primary),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
