import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:the_rock_mobile/components/app_title_bar.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/learn_model.dart';
import 'package:the_rock_mobile/screens/app/patient/learn_details.dart';

class Learn extends StatefulWidget {
  static const String namedRoute = "/learn";

  const Learn({super.key});

  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   final articleProvider =
    //       Provider.of<ArticleProvider>(context, listen: false);
    //   articleProvider.fetchAllArticles();
    // });
  }

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;

    void gotoLearnDetails(int index) {
      Get.to(
        () => const LearnDetails(),
        arguments: {
          "title": learnData[index].title,
          "message": learnData[index].message,
          "date": learnData[index].date,
          "image": learnData[index].image,
          "readtime": learnData[index].readtime,
        },
      );
    }

    return Scaffold(
      body: Column(
        children: [
          // appBar
          const PurpleAppTitleBar(title: "Learn"),

          const SizedBox(height: 20),

          // Consumer<ArticleProvider>(builder: (context, value, child) {
          // final articles = value.articles;
          // return
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: learnData.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                // final article = articles[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  child: LearnTile(
                    learn: learnData[index],
                    onTap: () {
                      gotoLearnDetails(index);
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: AppSizes.md + 5);
              },
            ),
          )
          // }),
        ],
      ),
    );
  }
}
