// import 'dart:convert';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_rock_mobile/components/auth_button.dart';
import 'package:the_rock_mobile/components/ink_button.dart';
import 'package:the_rock_mobile/components/labelled_input.dart';
import 'package:the_rock_mobile/components/secure_labelled_input_field.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_preference.dart';
import 'package:the_rock_mobile/models/requests/auth/auth_payload.dart';
import 'package:the_rock_mobile/providers/login_provider.dart';
import 'package:the_rock_mobile/screens/auth/forgot_password.dart';

class LoginDocotor extends StatefulWidget {
  static const String namedRoute = "/login-docotr";
  final void Function()? onTap;

  const LoginDocotor({super.key, required this.onTap});

  @override
  State<LoginDocotor> createState() => _LoginDocotorState();
}

class _LoginDocotorState extends State<LoginDocotor> {
  // bool authLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController prnController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    prnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginNotifier = Provider.of<LoginNotifier>(context);

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final appHeight = MediaQuery.of(context).size.height;

    void goBack() => Get.back();

    void gotoForgotpassword() {
      Get.to(() => const ForgotPassword());
    }

    /// DOCTOR AUTHENTICATION
    void login() async {
      final isValidForm = formKey.currentState!.validate();
      if (isValidForm) {
        String email = emailController.text.trim();
        String prn = prnController.text.trim();

        LoginDoctorPayload loginPayload = LoginDoctorPayload(
          email: email,
          prn: prn,
        );

        // setState(() => authLoading = true);
        loginNotifier.loginDoctor(loginPayload);

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool(AppPreference.isPatient, false);
        // setState(() => authLoading = false);
      } else {
        // setState(() => authLoading = false);
        Get.snackbar("Oops...", "Please fill all fields of the form",
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    /// logo
                    Image.asset(
                      AppImages.logo,
                      height: 150,
                    ),

                    /// header
                    Text(
                      "Welcome back",
                      style: textTheme.headlineLarge!.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// email
                    LabelledInputField(
                      label: "Email",
                      hintText: "Enter your email address",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email!.isEmpty) {
                          return "Email field cannot be empty";
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(height: 18),

                    /// prn
                    SecureInput(
                      controller: prnController,
                      textInputAction: TextInputAction.done,
                      validator: (String? prn) {
                        if (prn!.isEmpty) {
                          return "Prn field cannot be empty";
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(height: 5),

                    /// agreement
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: gotoForgotpassword,
                          // style: TextButton.styleFrom(backgroundColor: Colors.red),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "Forgot Prn?",
                              style: TextStyle(
                                fontSize: 14,
                                color: colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    //auth button
                    AuthButton(
                      showLoader: loginNotifier.processing ? true : false,
                      text: loginNotifier.processing
                          ? "authenticating..."
                          : "Login",
                      onTap: login,
                    ),

                    const SizedBox(height: 30),

                    //goto login
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Do you have an acccount?",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Sign up here",
                            style: TextStyle(
                              color: colorScheme.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: appHeight * 0.5)
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
