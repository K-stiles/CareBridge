import 'package:flutter/material.dart';
import 'package:the_rock_mobile/components/exports.dart';
// import 'package:the_rock_mobile/components/Heading.dart';
// import 'package:the_rock_mobile/components/paragraph.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class ScreenTwo extends StatelessWidget {
  final String title;
  final String desc;
  final String img;

  const ScreenTwo(
      {super.key, required this.title, required this.desc, required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // const Spacer(),
                const SizedBox(height: 100),

                // image
                Image.asset(
                  img,
                  height: 220,
                ),

                const SizedBox(height: 50),
                // const Spacer(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                  child: Column(
                    children: [
                      // headering
                      Heading(text: title),

                      const SizedBox(height: AppSizes.lg),

                      // paragraph
                      Paragraph(text: desc),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
