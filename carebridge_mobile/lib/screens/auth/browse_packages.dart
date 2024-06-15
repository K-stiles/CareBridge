import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/screens/app/patient/payment.dart';
import 'package:the_rock_mobile/screens/app/patient/profile_setup.dart';

class BrowsePackages extends StatelessWidget {
  static const String namedRoute = "/packages";

  const BrowsePackages({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    final List<String> packages = [
      "package 1",
      "package 2",
      "package 3",
      "package 4",
    ];

    void gotoPayment() => Get.to(() => const Payment());
    void payAsYouGo() => Get.to(() => const ProfileSetup());

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          children: [
            Text(
              "Browse our Packages",
              style:
                  textTheme.displayLarge!.copyWith(color: colorScheme.primary),
            ),

            const SizedBox(height: AppSizes.lg),

            const SizedBox(height: AppSizes.base_),
            SizedBox(
              width: appWidth * .8,
              child: Center(
                child: Text(
                  "Subscribe to any of our health service packages",
                  style: textTheme.bodyMedium!
                      .copyWith(color: Colors.grey.shade700),
                ),
              ),
            ),

            const SizedBox(height: AppSizes.lg),

            //PackageCard cards
            SizedBox(
              height: appHeight * 0.45,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: packages.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int id) {
                  return PackageCard(onTap: () => gotoPayment());
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: AppSizes.md);
                },
              ),
            ),

            // SizedBox(height: 10),
            const Spacer(),
            const Text("OR"),

            const Spacer(),

            OutlinedButton(
              onPressed: payAsYouGo,
              child: const Text("Pay as You Go"),
            ),

            const Spacer(),
          ],
        ),
      ),
    ));
  }
}
