import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/settings_options_model.dart';
import 'package:the_rock_mobile/providers/exports.dart';
import 'package:the_rock_mobile/screens/onboarding/getting_started.dart';

class DoctorProfile extends StatelessWidget {
  static const String namedRoute = "/doctor-profile";
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardNotifier onBoardNotifier = Provider.of<OnBoardNotifier>(context);
    final loginNotifier = Provider.of<LoginNotifier>(context);

    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void goBack() => Navigator.pop(context);

    void logout() async {
      onBoardNotifier.isLastPage = false;
      loginNotifier.logout();
      Get.offAll(() => const GettingStarted());
    }

    void cancelLogout() async {
      Get.back();
    }

    void profileTilePress(int index, SettingsOptions option) {
      if (option.logout) {
        Get.defaultDialog(
          title: 'Leaving so soon!',
          titlePadding: const EdgeInsets.all(20),
          contentPadding: const EdgeInsets.all(20),
          content: Column(
            children: [
              Icon(
                FluentIcons.sign_out_24_filled,
                size: 48,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 16),
              const Text(
                'Are you sure you want to logout?.',
                textAlign: TextAlign.center,
              )
            ],
          ),
          confirm:
              ElevatedButton(onPressed: logout, child: const Text('Log out')),
          cancel: OutlinedButton(
              onPressed: cancelLogout, child: const Text('Cancel')),
          barrierDismissible: true,
        );
      } else {
        Get.to(() => option.screen);
      }
    }

    return Scaffold(
      body: Column(
        children: [
          /// app bar
          PurpleAppBar(
            height: appHeight * .15,
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

                  SizedBox(width: appWidth * 0.28),

                  /// title
                  Text(
                    "Profile",
                    style:
                        textTheme.displayMedium!.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: AppSizes.lg),

          /// profile image
          Consumer<ImageUploaderNotifier>(
              builder: (context, imageUploader, child) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: colorScheme.secondary,
                  width: 6,
                ),
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: imageUploader.image != null
                      ? Image.file(imageUploader.image!,
                          height: AppSizes.xxl * 3,
                          width: AppSizes.xxl * 3,
                          fit: BoxFit.cover)
                      : Container(
                          height: AppSizes.xxl * 3,
                          width: AppSizes.xxl * 3,
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withOpacity(0.15),
                            borderRadius:
                                BorderRadius.circular(AppSizes.xxl * 3),
                          ),
                          child: Center(
                            child: Icon(
                              FluentIcons.camera_16_regular,
                              size: AppSizes.lg,
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                ),
              ),
            );
          }),

          /// body
          Expanded(
            child: ListView.separated(
              padding:
                  const EdgeInsets.only(top: AppSizes.md, bottom: AppSizes.xxl),
              scrollDirection: Axis.vertical,
              itemCount: settingsDocOptions.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final option = settingsDocOptions[index];
                return DocAccountTile(
                  onTap: () => profileTilePress(index, option),
                  settingsOptions: option,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: AppSizes.sm);
              },
            ),
          ),
        ],
      ),
    );
  }
}
