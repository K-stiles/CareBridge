import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class PharmacyCard extends StatelessWidget {
  const PharmacyCard({super.key});

  @override
  Widget build(BuildContext context) {
    // final appHeight = MediaQuery.of(context).size.height;
    // final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        // vertical: AppSizes.md,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: colorScheme.background,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DRUG",
                  style: textTheme.displaySmall,
                ),
                Text(
                  "Norvatis Voltfast 500mg",
                  style: textTheme.displaySmall,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "price",
                  style: textTheme.bodyMedium,
                ),
                Text(
                  "GHC 5.00",
                  style: textTheme.bodyMedium,
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quantity",
                  style: textTheme.bodyMedium,
                ),
                Text(
                  "4.0",
                  style: textTheme.bodyMedium,
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date",
                  style: textTheme.bodyMedium,
                ),
                Text(
                  "15/ 06/ 2023",
                  style: textTheme.bodyMedium,
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Status",
                  style: textTheme.bodyMedium,
                ),
                Text(
                  "Pending",
                  style: textTheme.bodyMedium,
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order type",
                  style: textTheme.bodyMedium,
                ),
                Text(
                  "Pickup",
                  style: textTheme.bodyMedium,
                )
              ],
            ),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: colorScheme.primary),
              ),
              child: Text(
                "Make Payment",
                style: textTheme.bodySmall!.copyWith(
                  color: colorScheme.primary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
