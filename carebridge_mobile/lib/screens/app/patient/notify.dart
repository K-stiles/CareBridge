import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:the_rock_mobile/components/app_bar.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/notifications.dart';

import 'notify_info.dart';

class Notify extends StatefulWidget {
  static const String namedRoute = "/notify";

  const Notify({super.key});

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  bool isRead = false;

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void gotoNotifyInfo(int index, Notifier notifier) {
      setState(() => isRead = true);
      Get.to(() => const NotifyInfo());
    }

    void goBack() => Get.back();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// app bar
          PurpleAppBar(
            height: appHeight * .18,
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

                  SizedBox(width: appWidth * 0.2),

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

          /// date
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.md, vertical: AppSizes.md),
            child: Text(
              "Today - June 15 2023",
              style: textTheme.bodySmall!.copyWith(color: Colors.grey.shade600),
            ),
          ),

          /// list
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: notificationsList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final notify = notificationsList[index];
                return NotifyCard(
                  notify: notify,
                  readColor: isRead ? Colors.white : Colors.grey.shade100,
                  onTap: () => gotoNotifyInfo(index, notify),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: AppSizes.base_);
              },
            ),
          ),
        ],
      ),
    );
  }
}
