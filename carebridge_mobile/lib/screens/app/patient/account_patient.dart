import 'package:email_validator/email_validator.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/requests/auth/update_payload.dart';
import 'package:the_rock_mobile/providers/exports.dart';

class PatientAccountSettings extends StatefulWidget {
  static const String namedRoute = "/account-settings";
  const PatientAccountSettings({super.key});

  @override
  State<PatientAccountSettings> createState() => _PatientAccountSettingsState();
}

class _PatientAccountSettingsState extends State<PatientAccountSettings> {
  bool isReady = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool checkReadyState() {
    return isReady = fullnameController.text.trim().isEmpty &&
        emailController.text.trim().isEmpty &&
        phoneController.text.trim().isEmpty;
  }

  @override
  void dispose() {
    emailController.dispose();
    fullnameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginNotifier = Provider.of<LoginNotifier>(context);
    final patientData = Provider.of<ProfileNotifier>(context).patientProfile;

    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void goBack() => Get.back();

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

    /// PATIENT INFO UPDATE
    void updatePatientInfo() async {
      final isValidForm = formKey.currentState!.validate();
      if (isValidForm) {
        String email = emailController.text.trim();
        String fullname = fullnameController.text.trim();
        String phone = phoneController.text.trim();

        UpdatePatientPayload updatePayload = UpdatePatientPayload(
          fullname: fullname == "" ? patientData!.fullname : fullname,
          email: email == "" ? patientData!.email : email,
          phone: phone == "" ? patientData!.phone : phone,
        );

        // print( "fullname:${patientData!.fullname} email:${patientData.email} phone:${patientData.phone}");
        // print(
        //     "\nupdatePayload fullname:${updatePayload.fullname} \nupdatePayload email:${updatePayload.email} \nupdatePayload phone:${updatePayload.phone}\n");
        // print("checkReadyState:${checkReadyState()}");

        loginNotifier.updatePatientInfo(updatePayload);
      } else {
        Get.snackbar("Oops...", "Please fill in the right data",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
            icon: const Icon(
              FluentIcons.warning_12_filled,
              color: Colors.white,
            ));
      }
    }

    return Scaffold(
      body: Column(
        children: [
          // appBar
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
                    "Account",
                    style:
                        textTheme.displayLarge!.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// profile image
          Consumer<ImageUploaderNotifier>(
              builder: (context, imageUploader, child) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: colorScheme.secondary,
                      width: 6,
                    ),
                  ),
                  child: InkWell(
                    onTap: profileEffect,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.transparent,
                      // backgroundImage: ,
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
                  ),
                ),
              ],
            );
          }),

          const SizedBox(height: 10),
          Text(
            "Profile Image",
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          ),

          const SizedBox(height: AppSizes.sm),

          /// FORM
          Consumer<ProfileNotifier>(builder: (context, profileNotifier, child) {
            profileNotifier.getPatientProfile();
            var pData = profileNotifier.patientProfile;
            return Form(
                key: formKey,
                child: Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.md,
                      vertical: AppSizes.xl,
                    ),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      /// FULLNAME FIELD

                      LabelledInputField(
                          label: "Full name",
                          hintText: pData!.fullname,
                          controller: fullnameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validator: (name) => null),

                      const SizedBox(height: AppSizes.md),

                      /// EMAIL FIELD
                      LabelledInputField(
                        label: "Email",
                        hintText: pData.email,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return null;
                          } else if (!EmailValidator.validate(email)) {
                            return "Invalid Email format";
                          } else {
                            return null;
                          }
                        },
                      ),

                      const SizedBox(height: AppSizes.md),

                      /// PHONE FIELD
                      LabelledInputField(
                        label: "Phone",
                        hintText: pData.phone == null || pData.phone == ""
                            ? "058 323 5675"
                            : pData.phone,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        validator: (phone) {
                          if (phone!.isEmpty) {
                            return null;
                          } else if (phone.length != 10) {
                            return "Invalid Phone number, must be eleven numbers";
                          } else {
                            return null;
                          }
                        },
                      ),

                      const SizedBox(height: AppSizes.xl),

                      Column(
                        children: [
                          ElevatedButton(
                              onPressed:
                                  checkReadyState() ? null : updatePatientInfo,
                              child: const Text("Save changes")),
                          const SizedBox(height: AppSizes.md),
                          OutlinedButton(
                              onPressed: goBack,
                              child: const Text("Discard changes")),
                        ],
                      )
                    ],
                  ),
                ));
          }),
        ],
      ),
    );
  }
}
