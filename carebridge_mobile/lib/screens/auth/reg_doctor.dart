import 'package:email_validator/email_validator.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_colors.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_preference.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/requests/auth/auth_payload.dart';
import 'package:the_rock_mobile/models/response/specialization.dart';
import 'package:the_rock_mobile/providers/signup_provider.dart';
import 'package:the_rock_mobile/providers/specialization_provider.dart';

import 'dart:math' as math;

class RegisterDoctor extends StatefulWidget {
  static const String namedRoute = "/doctor-register";
  final void Function()? onTap;

  const RegisterDoctor({super.key, required this.onTap});

  @override
  State<RegisterDoctor> createState() => _RegisterDoctorState();
}

class _RegisterDoctorState extends State<RegisterDoctor> {
  // bool authLoading = false;
  Specialization? selectedSpecialization;

  _RegisterDoctorState() {
    dropdownSelectedValue = areaofSpecialization[0];
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SpecializationNotifier>(context, listen: false)
          .fetchSpecializations();
    });
  }

  bool isReady = false;
  bool? isChecked = false;
  String agreementTerms = "DECLINED";
  String gender = "OTHER";

  String? dropdownSelectedValue = "";
  final List<String> areaofSpecialization = <String>[
    'Select your area of specialization',
    'Dentist',
    'Phamarcist',
    'Nutritionist',
    'Dietitian'
  ];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController prnController = TextEditingController();

  bool checkReadyState() {
    return isReady = fullnameController.text.isEmpty ||
            emailController.text.isEmpty ||
            prnController.text.isEmpty ||
            selectedSpecialization == null ||
            isChecked == false
        ? false
        : true;
  }

  @override
  void dispose() {
    emailController.dispose();
    fullnameController.dispose();
    prnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUpNotifier = Provider.of<SignUpNotifier>(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void goBack() => Navigator.of(context).pop();

    void attchID() {
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

    /// DOCTOR AUTHENTICATION
    void register() async {
      final isValidForm = formKey.currentState!.validate();
      if (isValidForm && checkReadyState() == true) {
        String email = emailController.text.trim();
        String prn = prnController.text.trim();
        String fullname = fullnameController.text.trim();
        agreementTerms = isChecked == false ? "DECLINED" : "ACCEPTED";

        RegDoctorPayload regPayload = RegDoctorPayload(
          email: email,
          prn: prn,
          fullname: fullname,
          gender: gender,
          terms: agreementTerms,
          profile: "",
          specializationId: selectedSpecialization!.id,
        );

        // setState(() => authLoading = true);
        signUpNotifier.registerDoctor(regPayload);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool(AppPreference.isPatient, false);
        // setState(() => authLoading = false);
      } else {
        // setState(() => authLoading = false);
        Get.snackbar("Oops...",
            "Please fill all the form fields correctly and check Agreement box to continue",
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: InkButton(onTap: goBack),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //logo
                    Image.asset(
                      AppImages.logo,
                      height: 100,
                    ),

                    //header
                    Text(
                      "Your Trusted Digital Health Partner",
                      style:
                          TextStyle(color: Colors.grey.shade800, fontSize: 12),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "Create your account",
                      style: textTheme.headlineMedium!.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),

                    const SizedBox(height: 20),

                    //name
                    LabelledInputField(
                      label: "Full name",
                      hintText: "Enter your username",
                      controller: fullnameController,
                      autofocus: true,
                      keyboardType: TextInputType.name,

                      /// validation
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "Name field cannot be empty";
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(height: 15),

                    //email
                    LabelledInputField(
                      label: "Email",
                      hintText: "Enter your email address",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      validator: (email) {
                        if (email!.isEmpty) {
                          return "Email field cannot be empty";
                        } else if (!EmailValidator.validate(email)) {
                          return "Invalid Email format";
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(height: 15),

                    /// SPECIALIZATION FIELD
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Specialization"),
                        const SizedBox(height: AppSizes.sm),
                        Consumer<SpecializationNotifier>(
                          builder: (context, data, child) {
                            final services = data.specializations;
                            return Container(
                              height: 60,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: DropdownButtonFormField<Specialization>(
                                hint: const Text("select your specialization"),
                                value: selectedSpecialization,
                                // isExpanded: true,
                                // menuMaxHeight: double.infinity,
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    color: AppColors.carebridgePrimary),
                                elevation: 16,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey.shade600),
                                validator: (value) => value == null
                                    // ? ''
                                    ? 'Please selectselect a service'
                                    : null,
                                onChanged: (Specialization? newValue) {
                                  setState(() {
                                    selectedSpecialization = newValue;
                                  });
                                },
                                items: services.map((specialization) {
                                  return DropdownMenuItem<Specialization>(
                                    value: specialization,
                                    child: Text(specialization.name),
                                  );
                                }).toList(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    //prn
                    SecureInput(
                      label: "Professioal Registration Number",
                      hintText: "Enter your PRN",
                      controller: prnController,
                      textInputAction: TextInputAction.done,
                      validator: (String? prn) {
                        if (prn!.isEmpty) {
                          return "Prn field cannot be empty";
                        } else if (prn.length < 8) {
                          return "Prn should be 8 or more characters";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 15),

                    //attachment
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //texts
                        const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Identification Card",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "( National , passport or Voters acceptable)",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ]),

                        //attach btn
                        GestureDetector(
                          onTap: attchID,
                          child: Column(
                            children: [
                              Transform.rotate(
                                angle: math.pi / 4,
                                child: const Icon(
                                  Icons.attach_file,
                                ),
                              ),
                              const Text("Attach ID")
                            ],
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 40),

                    ///agreement
                    AgreementBoxTile(
                      value: isChecked,
                      color: Colors.grey,
                      onChanged: (value) => setState(() => isChecked = value),
                    ),

                    const SizedBox(height: 20),

                    //auth button
                    AuthButton(
                      text: signUpNotifier.processing
                          ? "authenticating..."
                          : "Sign Up",
                      showLoader: signUpNotifier.processing ? true : false,
                      onTap: register,
                    ),

                    const SizedBox(height: 20),

                    const SizedBox(height: 25),

                    //goto login
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have an acccount?",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Login",
                            style: TextStyle(
                              color: AppColors.carebridgePrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSizes.xxl),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
