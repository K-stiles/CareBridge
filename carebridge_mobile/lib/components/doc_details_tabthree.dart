import 'package:flutter/material.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class DocDetailsTabThree extends StatelessWidget {
  const DocDetailsTabThree({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: AppSizes.lg),
      children: const [
        DocReviewCard(),
        SizedBox(height: AppSizes.md),
        DocReviewCard()
      ],
    );
  }
}
