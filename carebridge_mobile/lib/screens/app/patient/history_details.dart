import 'package:flutter/material.dart';
import 'package:the_rock_mobile/components/app_bar.dart';
import 'package:the_rock_mobile/components/ink_button.dart';
import 'package:the_rock_mobile/components/pharmacy_card.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class HistoryDetails extends StatelessWidget {
  static const String namedRoute = "/history-details";

  const HistoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // final List<String> docs = [
    //   "Maternity",
    //   "Nutrition",
    //   "OPD",
    //   "Gynaecology",
    //   "Nutritionist",
    //   "Dietitian",
    //   "others"
    //       "Maternity",
    //   "Nutrition",
    //   "OPD",
    //   "Gynaecology",
    //   "Nutritionist",
    //   "Dietitian",
    //   "others"
    // ];

    // void gotoNotifyInfo(int index) {
    //   Navigator.pushNamed(context, NotifyInfo.namedRoute);
    // }

    void goBack() => Navigator.pop(context);

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

                  SizedBox(width: appWidth * 0.26),

                  // title
                  Text(
                    "Pharmacy",
                    style:
                        textTheme.displayMedium!.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          /// title
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.md,
              vertical: AppSizes.md,
            ),
            child: Text(
              "Prescriptions",
              style: textTheme.bodyLarge!.copyWith(fontSize: 22),
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: const [
                /// body
                PharmacyCard(),
                SizedBox(height: 15),
                PharmacyCard(),
                SizedBox(height: 15),
              ],
            ),
          )
        ],
      ),
    );
  }
}
