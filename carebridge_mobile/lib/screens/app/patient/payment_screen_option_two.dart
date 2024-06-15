import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:the_rock_mobile/components/auth_button.dart';
import 'package:the_rock_mobile/components/icon_textformfield.dart';
import 'package:the_rock_mobile/components/pick_date_time.dart';
import 'package:the_rock_mobile/components/popup_subscription.dart';
import 'package:the_rock_mobile/components/switch_payment.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class PaymentOptionTwo extends StatefulWidget {
  const PaymentOptionTwo({super.key});

  @override
  State<PaymentOptionTwo> createState() => _PaymentOptionTwoState();
}

class _PaymentOptionTwoState extends State<PaymentOptionTwo> {
  DateTime dateTime = DateTime.now();

  void openDatePicker() {
    showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    ).then((value) => setState(() => dateTime = value!));
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputController = TextEditingController();
    final textTheme = Theme.of(context).textTheme;

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
          const SizedBox(height: AppSizes.lg),

          /** Card Owner Input */
          IconInputField(
            label: "Name of insurance company",
            hintText: "eg. Primier Health",
            controller: inputController,
            keyboardType: TextInputType.name,
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
          /** Card Number Input */
          IconInputField(
            label: "Name on Card",
            hintText: "Cardholder Name",
            controller: inputController,
            keyboardType: TextInputType.name,
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

          /** Card Number Input */
          IconInputField(
            label: "Card Number",
            hintText: "Enter card number",
            controller: inputController,
            keyboardType: TextInputType.name,
            svg: AppImages.card_primary,
            validator: (data) {
              if (data!.isEmpty) {
                return "Name field cannot be empty";
              } else {
                return null;
              }
            },
          ),

          const SizedBox(height: AppSizes.md),

          /** EXPIRY DATE  */
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Expiry date", style: textTheme.bodySmall),
              const SizedBox(height: AppSizes.base_),
              PickDateTime(
                onTap: openDatePicker,
                inputHeight: AppSizes.xl + 5,
                dateTime: DateFormat("yyy-MM-dd").format(dateTime),
                icon: SvgPicture.asset(AppImages.calendar,
                    fit: BoxFit.contain, height: 30),
              ),
            ],
          ),

          const SizedBox(height: AppSizes.md),

          const PaymentSwitch(label: "Save card details"),

          const SizedBox(height: AppSizes.md),

          /// PAYMET BUTTON
          AuthButton(text: "Pay Now", onTap: openPopup),

          const SizedBox(height: AppSizes.xxl),
        ],
      ),
    );
  }
}
