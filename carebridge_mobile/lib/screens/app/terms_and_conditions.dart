import 'package:flutter/material.dart';
import 'package:the_rock_mobile/components/app_bar.dart';
import 'package:the_rock_mobile/components/ink_button.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class TermsAndConditions extends StatelessWidget {
  static const String namedRoute = "/terms-conditions";

  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void goBack() => Navigator.pop(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          /// app bar
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

                  SizedBox(width: appWidth * 0.24),

                  // title
                  Text(
                    "Terms and Conditions",
                    style:
                        textTheme.displayMedium!.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          /// intro header
          Expanded(
            child:
                ListView(padding: const EdgeInsets.all(AppSizes.lg), children: [
              Text(
                "Introduction",
                style: textTheme.displayLarge!
                    .copyWith(color: colorScheme.primary),
              ),

              const SizedBox(height: AppSizes.md),

              /// intro content
              Text(
                "Welcome to Purple Care! Before using our app, please carefully read and understand the following Privacy Policy and Terms of Use. By accessing or using our app, you acknowledge and agree to comply with these policies.",
                style: textTheme.bodyMedium,
              ),

              const SizedBox(height: AppSizes.lg),

              /// header
              Text(
                "Privacy Policy",
                style: textTheme.displayLarge!
                    .copyWith(color: colorScheme.primary),
              ),
              const SizedBox(height: AppSizes.base_),
              Text(
                " ● Information collection and use",
                style:
                    textTheme.bodySmall!.copyWith(color: colorScheme.primary),
              ),

              const SizedBox(height: AppSizes.md),

              /// intro content
              Text(
                "Purple Care respects the privacy of our users (\"user\" or \"you\") and understands the importance of safeguarding your information. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use Purple Care. Personal Information: We may collect personally identifiable information, such as your name, date of birth, contact information, and health-related details, that you voluntarily provide to us when you register and use our app. Your health data is treated with the utmost confidentiality and is used to provide personalised health services to you. Usage Information: When you access our app, we may automatically collect certain information, such as your IP address, device type, operating system, and app usage statistics. This information helps us improve our app's performance and user experience. Security: We implement administrative, technical, and physical security measures to protect your personal information. However, please be aware that no method of data transmission over the internet is entirely secure, and we cannot guarantee the complete security of your information. \n\n ●\t Information Sharing We may share your information with third parties for specific purposes: Service Providers: We may share your information with service providers who assist us in providing our app's functionality and services. Legal Compliance: We may disclose your information if required by law, regulation, or legal process. User Consent: We will obtain your explicit consent before sharing your information for any other purpose not covered in this Privacy Policy. \n\n ●\t User Control You have the right to review, update, or delete your personal information stored in our app. You can access and manage your account settings within the app. Terms of Use \n\n ●\t Acceptance of Terms By accessing and using our Purple Care app, you agree to these Terms of Use. If you do not agree with any part of these terms, please do not use the app. \n\n ●\t User Responsibilities Accurate Information: You are responsible for providing accurate and complete information during registration and updating your details when necessary. Privacy: You are responsible for maintaining the confidentiality of your login credentials and ensuring that no unauthorised person accesses your account. Compliance: You agree to comply with all applicable laws and regulations while using our app. \n\n ●\t App Usage Health Information: The information and content provided in our app are for informational purposes only and should not be considered as medical advice. Always consult a qualified healthcare professional for medical concerns. Availability: We strive to ensure uninterrupted access to our app. However, we may need to suspend or discontinue services temporarily for maintenance or other reasons. \n\n ●\t Intellectual Property The app's content, design, and functionality are protected by copyright, trademark, and other intellectual property laws. You may not reproduce, distribute, or modify any part of our app without our explicit permission. \n\n ●\t Modifications to Terms We reserve the right to modify these Terms of Use at any time. Updated terms will be effective upon posting, and your continued use of the app signifies your acceptance of the revised terms. Contact Us If you have any questions or concerns about our Privacy Policy or Terms of Use, please contact us at : Company Name: Purple Care Address: Abeka Lapaz Phone Number: 054-323-6133 Email: carebridgegh@gmail.com Thank you for using Purple Care. Your privacy and well-being are of utmost importance to us.",
                style: textTheme.bodyMedium,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
