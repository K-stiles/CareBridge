import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_rock_mobile/components/app_bar.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/components/ink_button.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/screens/app/patient/about.dart';
import 'package:the_rock_mobile/screens/app/privacy_and_security.dart';
import 'package:the_rock_mobile/screens/app/terms_and_conditions.dart';
import 'notify_settings.dart';

class Settings extends StatelessWidget {
  static const String namedRoute = "/settings";

  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // void modal() {
    //   showModalBottomSheet(
    //     isDismissible: true,
    //     enableDrag: true,
    //     showDragHandle: true,
    //     context: context,
    //     builder: (context) {
    //       return SingleChildScrollView(
    //         child: Container(
    //             height: appHeight,
    //             width: appWidth,
    //             color: Colors.amber,
    //             child: const Center(
    //               child: Text("hahaha"),
    //             )),
    //       );
    //     },
    //   );
    // }

    void goBack() => Get.back();
    void gotoNotificationSettings() {
      Get.to(() => const NotificationSettings());
    }

    void gotoTermsandConditions() {
      Get.to(() => const TermsAndConditions());
    }

    void gotoPrivacypolicies() {
      Get.to(() => const PrivacyAndSecurity());
    }

    void gotoAboutus() {
      Get.to(() => const AboutCarebridge());
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// app bar

          PurpleAppBar(
            height: appHeight * .14,
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.xs),
            child: Container(
              alignment: const Alignment(0, 0.5),
              child: Row(
                children: [
                  InkButton(
                    onTap: goBack,
                    borderRadius: AppSizes.md,
                    background: colorScheme.background,
                    iconColor: colorScheme.primary,
                  ),

                  SizedBox(width: appWidth * 0.24),

                  // title
                  Text(
                    "Settings",
                    style:
                        textTheme.displayMedium!.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          /// body
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
            children: [
              ///theme tile
              const ChangeThemeButtonWidget(
                title: "App Theme",
                subtitle: "switch between light and dark mode",
              ),

              const SizedBox(height: AppSizes.base_),

              ///notifications tile
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                child: ListTile(
                  onTap: gotoNotificationSettings,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Notifications",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.primary),
                  ),
                  subtitle: Text(
                    "Manage your notifications here",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  leading: Container(
                    height: double.infinity,
                    width: 55,
                    decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppSizes.base_)),
                    child: Icon(Icons.notifications_active_outlined,
                        color: colorScheme.primary),
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.base_),

              ///Terms and Conditions tile
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                child: ListTile(
                  onTap: gotoTermsandConditions,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Terms and Conditions",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.primary),
                  ),
                  subtitle: Text(
                    "Our terms and conditions",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  leading: Container(
                    height: double.infinity,
                    width: 55,
                    decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppSizes.base_)),
                    child: Icon(FluentIcons.chart_person_20_regular,
                        color: colorScheme.primary),
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.base_),

              ///Privacy and Security tile
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                child: ListTile(
                  onTap: gotoPrivacypolicies,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Privacy and Security",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.primary),
                  ),
                  subtitle: Text(
                    "Our security and privacy policies",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  leading: Container(
                    height: double.infinity,
                    width: 55,
                    decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppSizes.base_)),
                    child: Icon(Icons.security, color: colorScheme.primary),
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.base_),

              ///about tile
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                child: ListTile(
                  onTap: gotoAboutus,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "About",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.primary),
                  ),
                  subtitle: Text(
                    "About Purple Care",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  leading: Container(
                    height: double.infinity,
                    width: 55,
                    decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppSizes.base_)),
                    child: Icon(Icons.info_outline, color: colorScheme.primary),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
