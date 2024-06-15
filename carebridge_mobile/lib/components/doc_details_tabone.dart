import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class DocDetailsTabOne extends StatelessWidget {
  const DocDetailsTabOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.base_),
      child: ListView(
        padding: const EdgeInsets.only(top: AppSizes.sm),
        children: const [
          Text(
            "I earned my Master's of Science in Clinical Counseling from Capella University in 2020. I am working towards my LPCC. I have experience with people from diverse backgrounds, cultures and belief systems. I have worked with adults who have Severe and Persistent Mental Illness such as Schizophrenia, Major Depressive Disorder, Bipolar I, as well as, co-occurring Substance Use disorders. I am thrilled to work in a school-based position at Richardson Elementary with children ages 5-12 years old. ",
          )
        ],
        // color: Colors.amber[400],
        // child: const Center(child: Text("1ST TAB")),
      ),
    );
  }
}
