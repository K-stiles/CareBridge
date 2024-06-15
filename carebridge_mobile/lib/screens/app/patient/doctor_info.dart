import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/screens/app/patient/appointment_booking.dart';
import 'package:the_rock_mobile/screens/app/patient/chat.dart';

class DoctorInfo extends StatelessWidget {
  static const String namedRoute = "/doctor-info";

  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    Map<String, dynamic> doctor = Get.arguments;

    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    List<String> infoOptions = ['About', 'Blogs', 'Reviews'];

    void goBack() => navigator.pop(context);

    void bookMe() {
      Get.to(() => const BookAppointment());
    }

    void chat() {
      Get.to(() => const Chat(), arguments: {
        "id": doctor["id"],
        "name": doctor["name"],
      });
    }

    void favorite() => print("favorite me");

    return DefaultTabController(
      initialIndex: 0,
      length: infoOptions.length,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkButton(onTap: goBack),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: <Widget>[
            /// image header
            ImageHeader(
              imageUrl: doctor["image"] != ""
                  ? doctor["image"]
                  : "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3270&q=80",
              height: appHeight * 0.4,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.lg, vertical: AppSizes.md),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// booking button
                        SizedBox(
                          width: appWidth * 0.4,
                          child: ElevatedButton(
                            onPressed: bookMe,
                            child: Text(
                              "Book me",
                              style: textTheme.displayMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),

                        /// chat section
                        Row(
                          children: [
                            // chat btn
                            TextButton(
                                onPressed: chat,
                                style: TextButton.styleFrom(
                                  backgroundColor: colorScheme.background,
                                  minimumSize:
                                      const Size(AppSizes.xl, AppSizes.xl),
                                ),
                                child: SvgPicture.asset(
                                  AppImages.chat,
                                  fit: BoxFit.contain,
                                )),

                            const SizedBox(width: AppSizes.base_),

                            // favorite btn
                            TextButton(
                              onPressed: favorite,
                              style: TextButton.styleFrom(
                                backgroundColor: colorScheme.background,
                                minimumSize:
                                    const Size(AppSizes.xl, AppSizes.xl),
                              ),
                              child: SvgPicture.asset(
                                AppImages.favorite,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ]),
            ),

            // body
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.md,
                    vertical: AppSizes.md,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // name and work section
                      Text(
                        doctor["name"],
                        style: textTheme.displayMedium,
                      ),
                      const SizedBox(height: AppSizes.base_),
                      Text(
                        "Cardiologist",
                        style: textTheme.bodySmall,
                      ),
                      const SizedBox(height: AppSizes.base_),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: AppSizes.md,
                          ),
                          const SizedBox(width: AppSizes.xs),
                          Text(
                            "4.6 (12 reviews)",
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSizes.xs),
                    ],
                  ),
                ),

                const Divider(thickness: 1),

                // details section
                const SizedBox(height: AppSizes.xs),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  child: DocDetailsTab(tabs: infoOptions),
                )
              ],
            ),
            // )
          ],
        ),
      ),
    );
  }
}
