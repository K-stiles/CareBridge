import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/exports.dart';
import 'package:the_rock_mobile/providers/exports.dart';
import 'package:the_rock_mobile/screens/app/doctor/profile_doctor.dart';
import 'package:the_rock_mobile/screens/app/patient/notify.dart';
import 'package:the_rock_mobile/utility/extract_firstname.dart';

class DocAppBar extends StatefulWidget {
  const DocAppBar({super.key});

  @override
  State<DocAppBar> createState() => _DocAppBarState();
}

class _DocAppBarState extends State<DocAppBar> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileNotifier>(context, listen: false).getDoctorProfile();
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void gotoNotification() {
      Get.to(() => const Notify());
    }

    void gotoProfile() {
      Get.to(() => const DoctorProfile());
    }

    /// app bar
    return PurpleAppBar(
      showTitle: true,
      height: appHeight * .20,
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.xs),

      ///Bar content
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ///user info
            Row(
              children: <Widget>[
                /// user profile
                Stack(
                  children: <Widget>[
                    Consumer<ImageUploaderNotifier>(
                        builder: (context, imageUploader, child) {
                      return GestureDetector(
                        onTap: gotoProfile,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: imageUploader.image != null
                                ? Image.file(
                                    imageUploader.image!,
                                    height: AppSizes.xxl * 3,
                                    width: AppSizes.xxl * 3,
                                    fit: BoxFit.cover,
                                  )
                                : SvgPicture.asset(
                                    AppImages.client,
                                    fit: BoxFit.cover,
                                    width: AppSizes.xxl * 3,
                                    height: AppSizes.xxxl,
                                    color: colorScheme.primary,
                                  ),
                          ),
                        ),
                      );
                    }),
                    Positioned(
                      right: 1,
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                ),

                const SizedBox(width: 10),

                Consumer<ProfileNotifier>(
                    builder: (context, profileNotifier, child) {
                  if (profileNotifier.processing == true) {
                    return const Text(
                      "Loading...",
                      style: TextStyle(color: Colors.white),
                    );
                  }

                  var doctorData = profileNotifier.doctorProfile;
                  final firstname = extractFirstName(doctorData!.fullname);
                  return Text(
                    "Hello Dr.$firstname,",
                    style: textTheme.displayLarge!.copyWith(
                      color: Colors.white,
                    ),
                  );
                }),
              ],
            ),

            //bell
            IconButton(
              onPressed: gotoNotification,
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
