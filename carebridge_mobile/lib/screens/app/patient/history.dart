import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:the_rock_mobile/components/app_title_bar.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/history_items.dart';
import 'package:the_rock_mobile/screens/app/patient/history_details.dart';

class History extends StatelessWidget {
  static const String namedRoute = "/history";

  const History({super.key});

  @override
  Widget build(BuildContext context) {
    void gotoDetails(int index) {
      Get.to(() => const HistoryDetails());
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            /// app bar
            const PurpleAppTitleBar(title: "History"),

            /// grid card
            Padding(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: historyData.length,
                itemBuilder: (BuildContext context, int index) {
                  return HistoryCard(
                    historyCard: historyData[index],
                    onTap: () => gotoDetails(index),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // childAspectRatio: 0.75,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
