import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/components/pick_date_time.dart';
import 'package:the_rock_mobile/components/row_input.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:the_rock_mobile/providers/exports.dart';
import 'package:the_rock_mobile/screens/app/patient/app.dart';
import 'package:the_rock_mobile/screens/app/patient/medical_details.dart';
import 'package:the_rock_mobile/screens/auth/login_or_reg_patient.dart';
import 'package:the_rock_mobile/utility/date_formatter.dart';

class ProfileSetup extends StatefulWidget {
  static const String namedRoute = "/profile-setup";

  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  DateTime dateOfBirth = DateTime.now();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  void openDatePicker() {
    showDatePicker(
      context: context,
      initialDate: dateOfBirth,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    ).then((value) => setState(() => dateOfBirth = value!));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    void goBack() => Get.back();
    void goHome() =>
        Get.off(() => const App());

        
    void gotoMedics() {
      final fullname = fullnameController.text.trim();
      final location = locationController.text.trim();
      final height = heightController.text.trim();
      final weight = weightController.text.trim();
      final date = DateFormatter.formatter(dateOfBirth);

      Get.to(() => const MedicalDetails(), arguments: {
        "fullname": fullname,
        "location": location,
        "height": height,
        "weight": weight,
        "dateOfBirth": date,
      });
    }

    void profileEffect() {
      showModalBottomSheet(
        isDismissible: true,
        enableDrag: true,
        showDragHandle: true,
        context: context,
        builder: (context) {
          return const AuthModal();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leadingWidth: AppSizes.xl + 10,
        leading: InkButton(onTap: goBack),
        actions: [
          TextButton(
              onPressed: goHome,
              child: Text(
                "Skip",
                style: textTheme.displaySmall!
                    .copyWith(color: colorScheme.primary),
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
              const Text("We would love to know you a little better"),
              const SizedBox(height: AppSizes.md),
              Center(
                child: Text("Personal Details".toUpperCase(),
                    style: textTheme.displayLarge),
              ),

              const SizedBox(height: AppSizes.lg),

              // image
              Consumer<ImageUploaderNotifier>(
                  builder: (context, imageUploader, child) {
                return InkWell(
                  onTap: profileEffect,
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

              const SizedBox(height: AppSizes.sm),

              Text(
                "upload Photo",
                style:
                    textTheme.bodySmall!.copyWith(color: Colors.grey.shade700),
              ),

              const SizedBox(height: AppSizes.xl),

              // form
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
                child: Column(
                  children: [
                    //name
                    IconInputField(
                      label: "Full name",
                      hintText: "Enter your username",
                      controller: fullnameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      svg: AppImages.profile,
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "Name field cannot be empty";
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(height: AppSizes.md),

                    /** DATE OF BIRTH */
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date of birth", style: textTheme.bodySmall),
                        const SizedBox(height: AppSizes.base_),
                        PickDateTime(
                          onTap: openDatePicker,
                          inputHeight: AppSizes.xl + 5,
                          dateTime:
                              DateFormat("dd / MM / yyyy").format(dateOfBirth),
                          icon: SvgPicture.asset(AppImages.calendar,
                              fit: BoxFit.contain, height: 30),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSizes.md),

                    //height and Weight
                    RowInput(
                      leftlabel: "Height",
                      lefthintText: "",
                      leftsvg: AppImages.profile,
                      leftcontroller: heightController,
                      rightlabel: "Weight",
                      righthintText: "",
                      rightsvg: AppImages.profile,
                      rightcontroller: weightController,
                    ),

                    const SizedBox(height: AppSizes.md),

                    //location
                    IconInputField(
                      label: "Location",
                      hintText: "awoshie",
                      controller: locationController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      svg: AppImages.location,
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "Location name field cannot be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSizes.lg),

              /// CONTINUE BUTTON
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: gotoMedics,
                      icon: const Icon(Icons.arrow_forward),
                      label: Text(
                        "Continue",
                        style: textTheme.bodyMedium!.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
