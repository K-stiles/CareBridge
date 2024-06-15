import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:the_rock_mobile/components/app_bar.dart';
import 'package:the_rock_mobile/components/ink_button.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class AboutCarebridge extends StatelessWidget {
  static const String namedRoute = "/about-us";

  const AboutCarebridge({super.key});

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void goBack() => Get.back();

    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                    "About Us",
                    style:
                        textTheme.displayMedium!.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          /// intro header
          Expanded(
            child:
                ListView(padding: const EdgeInsets.all(AppSizes.lg), children: [
              Text(
                "About Us",
                style: textTheme.displayLarge!
                    .copyWith(color: colorScheme.primary),
              ),

              const SizedBox(height: AppSizes.md),

              /// intro content
              Text(
                "About Us Carebridge is a digital health organization dedicated to meeting the unique healthcare needs of two important segments: busy corporate professionals and underserved communities. We understand the challenges faced by these groups in accessing quality healthcare, and we are committed to delivering convenient and equitable solutions. For busy corporate professionals, we recognize the demands of their fast-paced lifestyles and the limited time available for healthcare appointments. That's why we have developed a comprehensive suite of digital health services tailored to fit seamlessly into their schedules. Our platform enables them to access top-notch healthcare services virtually, anytime, anywhere. These include virtual consultations, mobile laboratory & mobile pharmacy services We are equally passionate about serving underserved communities. We believe that everyone, regardless of their socio-economic status, deserves access to high-quality healthcare. Our teleconsultations seek to bring essential healthcare resources directly to those who need them most. By combining convenience and equitable healthcare solutions, we strive to create a future where healthcare is accessible to all. \n\n Our Vision To be a leading and preferred provider, expanding access to sustainable healthcare  \n\n Our Mission To enhance healthcare accessibility and sustainability in Ghana and beyond by providing comprehensive and accessible digital health solutions to improve outcomes and empower individuals, prioritizing busy corporate professionals and underserved populations.  \n\n Our Values:  \nAccessibility  \nSocial  \nSustainability  \nIntegrity  \nInnovation  \nExcellence  \nEmpowerment",
                style: textTheme.bodyMedium,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
