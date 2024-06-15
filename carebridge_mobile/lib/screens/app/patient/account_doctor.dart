import 'package:email_validator/email_validator.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/requests/auth/update_payload.dart';
import 'package:the_rock_mobile/providers/exports.dart';

class DoctorAccountSettings extends StatefulWidget {
  static const String namedRoute = "/doc-account-settings";
  const DoctorAccountSettings({super.key});

  @override
  State<DoctorAccountSettings> createState() => _DoctorAccountSettingsState();
}

class _DoctorAccountSettingsState extends State<DoctorAccountSettings> {
  bool isReady = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();

  bool checkReadyState() {
    return isReady = fullnameController.text.trim().isEmpty &&
        emailController.text.trim().isEmpty &&
        qualificationController.text.trim().isEmpty;
  }

  @override
  void dispose() {
    emailController.dispose();
    fullnameController.dispose();
    qualificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginNotifier = Provider.of<LoginNotifier>(context);
    final doctorData = Provider.of<ProfileNotifier>(context).doctorProfile;

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

    /// DOCTOR INFO UPDATE
    void updateDoctorInfo() async {
      final isValidForm = formKey.currentState!.validate();
      if (isValidForm) {
        String email = emailController.text.trim();
        String fullname = fullnameController.text.trim();
        String qualification = qualificationController.text.trim();

        UpdateDoctorPayload updatePayload = UpdateDoctorPayload(
          email: fullname == "" ? doctorData!.fullname : fullname,
          fullname: email == "" ? doctorData!.email : email,
          qualification: qualification == ""
              ? doctorData!.qualification ?? ""
              : qualification,
          // gender: gender == "" ? doctorData!.gender : gender,
          // yoq: yoq == "" ? doctorData!.yoq : yoq,
          // yor: yor == "" ? doctorData!.yor : yor,
          // profile: profile == "" ? doctorData!.profile : profile,
        );

        // print( "fullname:${doctorData!.fullname} email:${doctorData.email} phone:${doctorData.phone}");
        // print( "\nupdatePayload fullname:${updatePayload.fullname} \nupdatePayload email:${updatePayload.email} \nupdatePayload phone:${updatePayload.qualification}\n");
        // print("checkReadyState:${checkReadyState()}");

        loginNotifier.updateDoctorInfo(updatePayload);
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
            profileNotifier.getDoctorProfile();
            var docData = profileNotifier.doctorProfile;
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
                          hintText: docData!.fullname,
                          controller: fullnameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validator: (name) => null),

                      const SizedBox(height: AppSizes.md),

                      /// EMAIL FIELD
                      LabelledInputField(
                        label: "Email",
                        hintText: docData.email,
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

                      /// TODO: GENDER DROPDOWN FIELD
                      // LabelledInputField(
                      //   label: "gender",
                      //   hintText: docData.gender ?? "Not specified",
                      //   controller: genderController,
                      //   keyboardType: TextInputType.text,
                      //   textInputAction: TextInputAction.done,
                      //   validator: (gender) => null,
                      // ),

                      /// QUALIFICATION FIELD
                      LabelledInputField(
                        label: "qualification",
                        hintText: docData.qualification ?? "Not specified",
                        controller: qualificationController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        validator: (qualification) => null,
                      ),

                      const SizedBox(height: AppSizes.xl),

                      Column(
                        children: [
                          ElevatedButton(
                              onPressed:
                                  checkReadyState() ? null : updateDoctorInfo,
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
