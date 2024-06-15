import 'package:flutter/material.dart';
import 'package:the_rock_mobile/components/auth_button.dart';
import 'package:the_rock_mobile/components/icon_textformfield.dart';
import 'package:the_rock_mobile/components/popup_subscription.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class PaymentOptionThree extends StatelessWidget {
  const PaymentOptionThree({super.key});

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;
    final TextEditingController inputController = TextEditingController();

    void openPopup() {
      showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return const SubscriptionPopUp();
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      child: Column(
        children: <Widget>[
          const SizedBox(height: AppSizes.md * 2),

          /** Card Owner Input */
          IconInputField(
            label: "Mobile money number",
            hintText: "eg. 0545354242",
            controller: inputController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
            svg: AppImages.mobile,
            validator: (data) {
              if (data!.isEmpty) {
                return "Name field cannot be empty";
              } else {
                return null;
              }
            },
          ),

          const SizedBox(height: AppSizes.md),

          /// AUTH BUTTON
          AuthButton(text: "Pay Now", onTap: openPopup),
        ],
      ),
    );
  }
}
