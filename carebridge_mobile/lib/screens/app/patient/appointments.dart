import 'package:flutter/material.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

import 'notify_info.dart';

class Appointments extends StatelessWidget {
  static const String namedRoute = "/appointments";

  const Appointments({super.key});

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final List<String> docs = [
      "Maternity",
      "Nutrition",
    ];

    void gotoNotifyInfo(int index) {
      Navigator.pushNamed(context, NotifyInfo.namedRoute);
    }

    void goBack() => Navigator.pop(context);

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

                  SizedBox(width: appWidth * 0.22),

                  // title
                  Text(
                    "Appointments",
                    style:
                        textTheme.displayMedium!.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          /// titles
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.md, vertical: AppSizes.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upcoming",
                  style: textTheme.displayMedium!
                      .copyWith(color: Colors.grey.shade600),
                ),
                Text(
                  "Past",
                  style: textTheme.displayMedium!
                      .copyWith(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          /// list
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: docs.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  child: AppointmentCard(onTap: () => gotoNotifyInfo(index)),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
                  child: Divider(height: AppSizes.base_, thickness: 2),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
