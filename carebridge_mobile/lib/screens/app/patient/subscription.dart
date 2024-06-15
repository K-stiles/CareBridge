import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_rock_mobile/components/ink_button.dart';
import 'package:the_rock_mobile/components/package_card.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/screens/auth/browse_packages.dart';

// import '../auth/browse_packages.dart';

class Subscriptions extends StatelessWidget {
  static const String namedRoute = "/subscriptions";

  const Subscriptions({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    final List<String> packages = ["basic plan"];

    void goBack() => Navigator.pop(context);

    void gotoPackages() {
      Get.to(() => const BrowsePackages());
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "Your Package",
            style: textTheme.displayLarge!.copyWith(color: colorScheme.primary),
          ),
          leading: InkButton(onTap: goBack),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.md),
            child: Column(
              children: [
                const SizedBox(height: AppSizes.base_),
                SizedBox(
                  width: appWidth * .8,
                  child: Center(
                    child: Text(
                      "You are currently on the Basic Plan",
                      style: textTheme.bodyMedium!
                          .copyWith(color: Colors.grey.shade700),
                    ),
                  ),
                ),

                const SizedBox(height: AppSizes.lg),

                /// PackageCard cards
                SizedBox(
                  height: appHeight * 0.45,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: packages.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int id) {
                      return PackageCard(onTap: () {});
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: AppSizes.md);
                    },
                  ),
                ),

                const Spacer(),

                OutlinedButton(
                  onPressed: gotoPackages,
                  child: const Text("Upgrade package"),
                ),

                const Spacer(),
              ],
            ),
          ),
        ));
  }
}
