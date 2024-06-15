import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:the_rock_mobile/components/auth_button.dart';
import 'package:the_rock_mobile/components/labelled_input.dart';
import 'package:the_rock_mobile/constants/app_colors.dart';
import 'package:the_rock_mobile/constants/app_images.dart';

class ForgotPassword extends StatelessWidget {
  static const String namedRoute = "/forgot-password";

  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final TextEditingController emailController = TextEditingController();
    void goBack() => Navigator.of(context).pop();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          style: const ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color>(AppColors.carebridgePrimary),
          ),
          icon: const Icon(Icons.arrow_back),
          onPressed: goBack,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //logo
                  Image.asset(AppImages.logo, height: 150),

                  //header
                  //header
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.primary,
                    ),
                  ),

                  const SizedBox(height: 25),

                  //email
                  LabelledInputField(
                    label: "Email",
                    hintText: "Enter your mail address",
                    obscureText: false,
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

                  const SizedBox(height: 25),

                  //auth button
                  AuthButton(
                    text: "proceed",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
