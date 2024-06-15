import 'package:flutter/material.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

// import 'doc_details_tabone.dart';
// import 'doc_details_tabthree.dart';
// import 'doc_details_tabtwo.dart';

class DocDetailsTab extends StatelessWidget {
  const DocDetailsTab({Key? key, required this.tabs}) : super(key: key);

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // top tabs
        TabBar(
          indicatorColor: colorScheme.primary,
          indicatorWeight: AppSizes.xs,
          labelColor: Colors.grey.shade800,
          labelStyle:
              textTheme.displayMedium!.copyWith(color: Colors.grey.shade700),
          tabs: [
            Tab(icon: Text(tabs[0])),
            Tab(icon: Text(tabs[1])),
            Tab(icon: Text(tabs[2]))
          ],
        ),

        // body
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: const TabBarView(children: <Widget>[
            DocDetailsTabOne(),
            DocDetailsTabTwo(),
            DocDetailsTabThree()
          ]),
        ),
      ],
    );
  }
}
