import 'package:flutter/material.dart';
import 'package:the_rock_mobile/components/app_bar.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class NotificationSettings extends StatefulWidget {
  static const String namedRoute = "/notification-settings";

  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void goBack() => Navigator.pop(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
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

                  SizedBox(width: appWidth * 0.22),

                  // title
                  Text(
                    "Notifications",
                    style:
                        textTheme.displayMedium!.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(AppSizes.lg),
              children: const [
                SettingsTile(
                  title: "Incoming Messages",
                  subtitle: "When Doctors message you",
                ),
                SizedBox(height: AppSizes.xs),
                SettingsTile(
                  title: "Booking response",
                  subtitle: "Manage your notifications here",
                ),
                SizedBox(height: AppSizes.xs),
                SettingsTile(
                  title: "Pharmacy",
                  subtitle: "When order is ready",
                ),
                SizedBox(height: AppSizes.xs),
                SettingsTile(
                  title: "Laboratory",
                  subtitle: "When test results are ready",
                ),
                SizedBox(height: AppSizes.xs),
                SettingsTile(
                  title: "Reminder",
                  subtitle: "When your bookings are near",
                ),
                SizedBox(height: AppSizes.xs),
              ],
            ),
          )
        ],
      ),
    );
  }
}
