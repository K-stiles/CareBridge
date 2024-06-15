import 'dart:math' as math;

import 'package:email_validator/email_validator.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_preference.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/requests/auth/auth_payload.dart';
import 'package:the_rock_mobile/providers/exports.dart';

class PatientRegistration extends StatefulWidget {
  static const String namedRoute = "/patient-register";
  final void Function()? onTap;

  const PatientRegistration({super.key, required this.onTap});

  @override
  State<PatientRegistration> createState() => _PatientRegistrationState();
}

class _PatientRegistrationState extends State<PatientRegistration> {
  bool authLoading = false;
  bool isReady = false;
  bool? isChecked = false;
  String agreementTerms = "DECLINED";
  String gender = "OTHER";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool checkReadyState() {
    return isReady = fullnameController.text.isEmpty ||
            emailController.text.isEmpty ||
            passwordController.text.isEmpty ||
            isChecked == false
        ? false
        : true;
  }

  @override
  void dispose() {
    emailController.dispose();
    fullnameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUpNotifier = Provider.of<SignUpNotifier>(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void goBack() => Get.back();

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

    /// PATIENT AUTHENTICATION
    void register() async {
      String password = passwordController.text.trim();
      String confirmPassword = confirmPasswordController.text.trim();

      if (password != confirmPassword) {
        Get.snackbar("Oops...", "Password and Confirm Pasword donot match",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
            icon: const Icon(
              FluentIcons.warning_12_filled,
              color: Colors.white,
            ));
      }

      final isValidForm = formKey.currentState!.validate();
      if (isValidForm && checkReadyState() == true) {
        String email = emailController.text.trim();
        String fullname = fullnameController.text.trim();
        agreementTerms = isChecked == false ? "DECLINED" : "ACCEPTED";

        RegPatientPayload regPayload = RegPatientPayload(
          email: email,
          password: password,
          fullname: fullname,
          gender: gender,
          terms: agreementTerms,
        );

        setState(() => authLoading = true);
        signUpNotifier.registerPatient(regPayload);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool(AppPreference.isPatient, true);
        setState(() => authLoading = false);
      } else {
        setState(() => authLoading = false);
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
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //logo
                    Image.asset(AppImages.logo, height: 100),

                    //header
                    Text(
                      "Your Trusted Digital Health Partner",
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 12),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "Create your account",
                      style: textTheme.headlineMedium!.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // FULL_NAME
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

                    // EMAIL
                    LabelledInputField(
                      label: "Email",
                      hintText: "Enter your email address",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
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

                    // PASSWORD
                    SecureInput(
                      controller: passwordController,
                      validator: (String? password) {
                        if (password!.isEmpty) {
                          return "Password field cannot be empty";
                        } else if (password.length < 6) {
                          return "Password should be 8 or more characters";
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(height: 20),

                    // CONFIRM PASSWORD
                    SecureInput(
                      label: "Confirm Password",
                      hintText: "same characters as the field above",
                      controller: confirmPasswordController,
                      textInputAction: TextInputAction.done,
                      validator: (String? confirmpassword) {
                        if (confirmpassword!.isEmpty) {
                          return "Confirm Password field cannot be empty";
                        } else if (confirmpassword !=
                            passwordController.text.trim()) {
                          return "Please both Passwords fields must match";
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(height: 35),

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

                    /// AGREEMENT BOX_TILE
                    AgreementBoxTile(
                      value: isChecked,
                      color: isChecked == null ? Colors.redAccent : Colors.grey,
                      onChanged: (value) => setState(() => isChecked = value),
                      // validator: (value) {
                      //   if (!isChecked) {
                      //     return 'You need to accept terms';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                    ),

                    const SizedBox(height: 20),

                    //auth button
                    AuthButton(
                      showLoader: authLoading ? true : false,
                      text: authLoading ? "authenticating..." : "Sign Up",
                      onTap: register,
                    ),

                    const SizedBox(height: 20),

                    //social login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Spacer(),

                        //apple
                        SocialLogin(
                          onTilePressed: () {},
                          tileImage: "assets/images/apple.png",
                        ),

                        const SizedBox(width: 15),

                        //gmail
                        SocialLogin(
                          onTilePressed: () {},
                          tileImage: "assets/images/gmail.png",
                        ),

                        const SizedBox(width: 20),

                        //facebook
                        SocialLogin(
                          onTilePressed: () {},
                          tileImage: "assets/images/facebook.png",
                        ),
                        const Spacer(),
                      ],
                    ),

                    const SizedBox(height: 25),

                    //goto login
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Already have an acccount?",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Login",
                            style: TextStyle(
                                color: colorScheme.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
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
