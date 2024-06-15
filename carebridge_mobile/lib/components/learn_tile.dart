import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/learn_model.dart';

// import '../models/learn_model.dart';

class LearnTile extends StatelessWidget {
  final Learn learn;
  final void Function()? onTap;
  const LearnTile({super.key, required this.onTap, required this.learn});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        // height: 225,
        decoration: BoxDecoration(
            color: colorScheme.background,
            borderRadius: BorderRadius.circular(AppSizes.xs),
            border: Border.all(color: Colors.grey.shade300)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSizes.xs),
                topRight: Radius.circular(AppSizes.xs),
              ),
              child: Image.network(
                learn.image,
                height: AppSizes.xxl * 2,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // info section
            Padding(
              padding: const EdgeInsets.all(AppSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    learn.title,
                    style: textTheme.displayMedium,
                  ),

                  const SizedBox(height: AppSizes.base_),
                  // pill
                  Row(
                    children: [
                      // ListView.builder(itemBuilder: itemBuilder)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(AppSizes.xs),
                        ),
                        child: Text(
                          "stomach upset",
                          style: textTheme.bodySmall!
                              .copyWith(color: Colors.grey.shade600),
                        ),
                      ),
                      const SizedBox(width: AppSizes.xs),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(AppSizes.xs),
                        ),
                        child: Text(
                          "Constiption",
                          style: textTheme.bodySmall!
                              .copyWith(color: Colors.grey.shade600),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSizes.xs),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
