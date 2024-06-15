import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class DocDetailsTabTwo extends StatelessWidget {
  const DocDetailsTabTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.base_),
      child: ListView(
        padding: const EdgeInsets.only(top: AppSizes.sm),
        children: const [
          Text(
            "These are your daily Blogs.Exception caught by rendering library hen a column is in a parent that does not provide a finite height constraint, for example if it is in a vertical scrollable, it will try to shrink-wrap its children along the vertical axis. Setting a flex on a child (e.g.",
          )
        ],
        // color: Colors.amber[400],
        // child: const Center(child: Text("1ST TAB")),
      ),
    );
  }
}
