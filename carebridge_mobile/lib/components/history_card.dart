import 'package:flutter/material.dart';
import 'package:the_rock_mobile/models/history_items.dart';
// import '../models/history_items.dart';

class HistoryCard extends StatelessWidget {
  final void Function()? onTap;
  final HistoryCardData historyCard;
  const HistoryCard(
      {super.key, required this.onTap, required this.historyCard});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 110,
          width: 130,
          decoration: BoxDecoration(
              color: colorScheme.background,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  historyCard.image,
                  height: 60,
                  width: 60,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                Text(historyCard.label),
              ],
            ),
          ),
        ));
  }
}
