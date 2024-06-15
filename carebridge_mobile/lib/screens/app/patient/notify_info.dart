import 'package:flutter/material.dart';
import 'package:the_rock_mobile/components/app_bar.dart';
import 'package:the_rock_mobile/components/ink_button.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class NotifyInfo extends StatelessWidget {
  static const String namedRoute = "/notify-info";
  const NotifyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    void goBack() => Navigator.pop(context);

    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // app bar

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

          //body
          Padding(
            padding: const EdgeInsets.all(AppSizes.md),
            child: Column(
              children: <Widget>[
                // date/time
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "June 15 2023",
                        style: textTheme.bodySmall!
                            .copyWith(color: Colors.grey.shade600),
                      ),
                    ]),

                const SizedBox(height: AppSizes.md),

                // image/title
                Row(children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    child: ClipOval(
                      child: Image.network(
                        AppImages.doctor1,
                        width: AppSizes.xxl * 3,
                        height: AppSizes.xxxl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(width: AppSizes.sm),

                  // title
                  Text(
                    "Appointment booking confirmed",
                    style: textTheme.displayLarge!
                        .copyWith(color: colorScheme.primary),
                  ),
                ]),

                const SizedBox(height: AppSizes.lg),

                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // message title
                      Text("Hello Annette,", style: textTheme.displaySmall),

                      const SizedBox(height: AppSizes.sm),

                      // message body
                      const Text(
                          "indly note that your appointment with Dr. Leslie Alexander for June  6  2023 has been confirmed.")
                    ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
