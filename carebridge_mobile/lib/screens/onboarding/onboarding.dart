import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_rock_mobile/components/exports.dart';
// import 'package:the_rock_mobile/components/Button.dart';
// import 'package:the_rock_mobile/components/ghost_button.dart';
// import 'package:the_rock_mobile/providers/onboarding_provider.dart';
import 'package:the_rock_mobile/constants/exports.dart';
import 'package:the_rock_mobile/providers/exports.dart';
import 'package:the_rock_mobile/screens/onboarding/exports.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  static const String namedRoute = "/onboarding";

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController pageController = PageController(initialPage: 0);

  final List<Widget> screens = [
    const ScreenOne(
      title: "Access Medical Care With Ease",
      desc: "Skip the hustle of walking to a clinic. We are just a tap away.",
      img: AppImages.onboarding2,
    ),
    const ScreenTwo(
      title: "Book your hospital appointments",
      desc:
          "No need joining long queues. Let us know when you want to come in.",
      img: AppImages.onboarding3,
    ),
    const ScreenThree(
      title: "Connect with your favourite doctors",
      desc: "You get to choose who takes care of you.",
      img: AppImages.onboarding4,
    ),
    const GettingStarted()
  ];

  void skip() => {pageController.jumpToPage(screens.length)};

  void next() => {
        pageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn)
      };

  void gotoPrev() => {
        pageController.previousPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn)
      };

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(child:
          Consumer<OnBoardNotifier>(builder: (context, onBordNotifier, child) {
        return Stack(
          children: [
            //pages
            PageView.builder(
              physics: onBordNotifier.isLastPage
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (currentPage) {
                onBordNotifier.isFirstPage = currentPage;
                onBordNotifier.isLastPage = currentPage == (screens.length - 1);
              },
              itemCount: screens.length,
              itemBuilder: (BuildContext context, int index) {
                return screens[index % screens.length];
              },
            ),

            /// BACK BTN
            onBordNotifier.isLastPage || onBordNotifier.isFirstPage == 0
                ? const SizedBox.shrink()
                : InkWell(
                    onTap: gotoPrev,
                    child: Container(
                      padding: const EdgeInsets.all(AppSizes.sm),
                      margin: const EdgeInsets.only(left: AppSizes.sm),
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.circular(AppSizes.md),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: colorScheme.background,
                      ),
                    ),
                  ),

            // dots
            onBordNotifier.isLastPage
                ? const SizedBox.shrink()
                : Container(
                    alignment: const Alignment(0, 0.75),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //skip
                          GhostButton(onTap: skip, text: "Skip"),

                          const Spacer(),

                          //dots
                          SmoothPageIndicator(
                            controller: pageController,
                            count: screens.length,
                            effect: WormEffect(
                              spacing: 12.0,
                              radius: 8.0,
                              dotWidth: 14.0,
                              dotHeight: 14.0,
                              paintStyle: PaintingStyle.stroke,
                              strokeWidth: 0,
                              dotColor: colorScheme.primary,
                              activeDotColor: colorScheme.primary,
                            ),
                          ),

                          const Spacer(),

                          Button(onTap: next, text: "Next"),
                        ],
                      ),
                    ),
                  )
          ],
        );
      })),
    );
  }
}
