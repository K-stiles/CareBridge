import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_preference.dart';
import 'package:the_rock_mobile/models/requests/exports.dart';
import 'package:the_rock_mobile/providers/exports.dart';
import 'package:the_rock_mobile/screens/auth/exports.dart';

class Login extends StatefulWidget {
  static const String namedRoute = "/login";
  final void Function()? onTap;

  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool authLoading = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginNotifier = Provider.of<LoginNotifier>(context);

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void goBack() => Get.back();
    void gotoForgotpassword() => Get.to(() => const ForgotPassword());

    /// PATIENT AUTHENTICATION
    void login() async {
      final isValidForm = formKey.currentState!.validate();
      if (isValidForm) {
        String email = emailController.text.trim();
        String password = passwordController.text.trim();

        LoginPatientPayload loginPayload = LoginPatientPayload(
          email: email,
          password: password,
        );

        loginNotifier.loginPatient(loginPayload);

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool(AppPreference.isPatient, true);
      } else {
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
                      style: textTheme.headlineMedium!.copyWith(
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

                    /// password
                    SecureInput(
                      controller: passwordController,
                      textInputAction: TextInputAction.done,
                      validator: (String? password) {
                        if (password!.isEmpty) {
                          return "Password field cannot be empty";
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
                              "Forgot Password?",
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

                    const Text("or login with"),

                    const SizedBox(height: 25),

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
