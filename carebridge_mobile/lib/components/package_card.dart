import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class PackageCard extends StatelessWidget {
  final void Function()? onTap;
  const PackageCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final appWidth = MediaQuery.of(context).size.width;

    return Container(
      height: double.infinity,
      width: appWidth * 0.7,
      decoration: BoxDecoration(
        color: colorScheme.background,
        borderRadius: BorderRadius.circular(AppSizes.xs),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header
            Text(
              "Basic Plan",
              style:
                  textTheme.displayLarge!.copyWith(color: colorScheme.primary),
            ),

            const SizedBox(height: AppSizes.md),
            // body list
            const Text("1. 168hrs open chat consult 1"),
            const SizedBox(height: AppSizes.sm),
            const Text(
              "2. 168hrs open chat consult 1 voice call consultation1 ",
            ),
            const SizedBox(height: AppSizes.sm),
            const Text(
              "3. 168hrs open chat consult 1 voice call consultation1 ",
            ),
            const SizedBox(height: AppSizes.sm),
            const Text(
              "4. 168hrs open chat consult 1 voice call consultation1 ",
            ),
            const SizedBox(height: AppSizes.sm),
            const Text(
              "5. 168hrs open chat consult 1 voice call consultation1 ",
            ),

            const Spacer(),

            // button
            ElevatedButton(
              onPressed: onTap,
              child: Text(
                "Subscribe for GHS 100/month",
                textAlign: TextAlign.center,
                style: textTheme.displaySmall!.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
