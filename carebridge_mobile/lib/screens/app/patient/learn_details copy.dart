import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:the_rock_mobile/components/ink_button.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/screens/app/patient/notify.dart';
// import 'package:the_rock_mobile/screens/app/notify.dart';

class LearnDetails extends StatelessWidget {
  static const String namedRoute = "/learn-details";

  const LearnDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // final Map learn =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    void goBack() => Get.back();
    void gotoNotification() {
      Get.to(() => const Notify());
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkButton(onTap: goBack),
        actions: [
          IconButton(
              onPressed: gotoNotification,
              icon: Icon(
                Icons.notifications_on_outlined,
                color: colorScheme.primary,
                size: 26,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.ios_share_outlined,
                color: colorScheme.primary,
                size: 26,
              )),
          const SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
        child: Column(
          children: <Widget>[
            //header text
            SizedBox(
              width: appWidth * 0.7,
              child: Text(
                "title",
                // learn["title"],
                textAlign: TextAlign.center,
                style: textTheme.displayLarge,
              ),
            ),

            const SizedBox(height: AppSizes.sm),

            // carebridge and share btn
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // avatar
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: AppSizes.md + 5,
                      child: ClipOval(
                        child: Image.asset(
                          AppImages.logo,
                          width: AppSizes.xxl * 3,
                          height: AppSizes.xxxl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: AppSizes.sm,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Addictions and Inplications",
                          style: textTheme.displaySmall!
                              .copyWith(color: colorScheme.primary),
                        ),
                        Text(
                          "readtime min read . date",
                          // "${learn["readtime"]} min read . ${learn["date"]}",
                          style: textTheme.bodySmall!
                              .copyWith(color: Colors.grey.shade600),
                        ),
                      ],
                    )
                  ],
                ),

                // share btn
                Icon(
                  FluentIcons.communication_person_20_filled,
                  size: 35,
                  color: colorScheme.primary,
                ),
              ],
            ),

            const SizedBox(height: AppSizes.md),

            // image
            SizedBox(
              width: double.infinity,
              child: Image.network(
                "image",
                // learn["image"],
                height: appHeight * 0.2,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: AppSizes.lg),

            // info data
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // summary
                Text(
                  "Irritable Bowel Syndrome (IBS) is a common gastrointestinal disorder that affects the large intestine. It is a chronic condition characterized by a group of symptoms that can vary from person to person. The exact cause of IBS is not known, but it is believed to involve a combination of factors, including abnormal muscle contractions in the intestine, increased sensitivity to pain, and changes in the gut microbiota.",
                  style: textTheme.bodyMedium!
                      .copyWith(color: Colors.grey.shade800),
                ),

                const SizedBox(height: AppSizes.md),

                // header
                Text("Symptoms of Irritable Bowel Syndrome:",
                    style: textTheme.displaySmall),

                const SizedBox(height: AppSizes.base_),

                // body
                Text(
                  "1. Abdominal pain or cramping: This is one of the most common symptoms of IBS. The pain is typically relieved or partially relieved after a bowel movement. Changes in bowel habits: IBS can cause either diarrhea or constipation. Some individuals may experience alternating episodes of both. Bloating and gas: Many people with IBS complain of bloating and increased gas production. Abnormal stool consistency: Stools may vary in appearance, ranging from loose and watery to hard and lumpy. Urgency to have a bowel movement:\n\n 2. People with IBS often feel an urgent need to have a bowel movement, which may be difficult to control. Care and Management of Irritable Bowel Syndrome: Dietary modifications: Keep a food diary to identify trigger foods that worsen your symptoms. Common triggers include fatty foods, spicy foods, caffeine, alcohol, and certain types of carbohydrates like lactose and fructose. A low FODMAP diet, which restricts certain types of carbohydrates, has been found to be helpful for some individuals with IBS. Fiber intake: Gradually increase your fiber intake through fruits, vegetables, and whole grains. Fiber can help regulate bowel movements and reduce constipation. Stress management: Stress and anxiety can exacerbate IBS symptoms. Engage in stress-reducing activities such as exercise, yoga, meditation, or counseling. Medications: Depending on your symptoms, your doctor may prescribe medications such as antispasmodics to relieve abdominal pain and cramping, laxatives for constipation, or anti-diarrheal medications. Probiotics: Some studies suggest that certain strains of probiotics may help alleviate IBS symptoms. Talk to your doctor about incorporating probiotic supplements into your routine. Regular exercise: Physical activity can help promote regular bowel movements and reduce stress levels, which may in turn improve IBS symptoms. Support and education: Joining support groups or seeking therapy can provide a sense of community and help you cope with the challenges of living with IBS. It's important to note that IBS is a chronic condition, and the symptoms can vary in severity over time. It's best to work closely with a healthcare professional to develop an individualized treatment plan that suits your specific needs.",
                  style: textTheme.bodyMedium!
                      .copyWith(color: Colors.grey.shade700),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
