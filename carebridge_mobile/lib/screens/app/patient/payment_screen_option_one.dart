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

class PaymentOptionOne extends StatefulWidget {
  const PaymentOptionOne({super.key});

  @override
  State<PaymentOptionOne> createState() => _PaymentOptionOneState();
}

class _PaymentOptionOneState extends State<PaymentOptionOne> {
  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  final TextEditingController inputController = TextEditingController();
  final TextEditingController expireDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  void openDatePicker() {
    showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    ).then((value) => setState(() => dateTime = value!));
  }

  void openTimePicker() {
    showTimePicker(
      context: context,
      initialTime: timeOfDay,
    ).then((time) => setState(() => timeOfDay = time!));
  }
  //  dateTime: timeOfDay.format(context).toString(),
  //  dateTime: DateFormat("yyy-MM-dd").format(dateTime),
  //  onTap: () => openTimePicker(),

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final appWidth = MediaQuery.of(context).size.width;

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
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
      child: Column(
        children: <Widget>[
          /** CARD IMAGE */
          SvgPicture.asset(AppImages.payment_card, fit: BoxFit.cover),

          /** Card Owner Input */
          IconInputField(
            label: "Name on card",
            hintText: "Card Holder Name",
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /** LEFT */
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Expiry date", style: textTheme.bodySmall),
                  const SizedBox(height: AppSizes.base_),
                  PickDateTime(
                    onTap: openDatePicker,
                    inputHeight: AppSizes.xl + 5,
                    inputWidth: appWidth * 0.4,
                    dateTime: DateFormat("yyy-MM-dd").format(dateTime),
                    icon: SvgPicture.asset(
                      AppImages.calendar,
                      fit: BoxFit.contain,
                      height: 30,
                    ),
                  ),
                ],
              ),

              /** INPUTFIELD 1 */
              IconInputField(
                label: "CVV",
                hintText: "****",
                controller: inputController,
                inputWidth: appWidth * 0.4,
                keyboardType: TextInputType.name,
                svg: AppImages.card_primary,
                validator: (data) {
                  if (data!.isEmpty) {
                    return "leftlabel field cannot be empty";
                  } else {
                    return null;
                  }
                },
              ),
            ],
          ),

          const SizedBox(height: AppSizes.md),

          /// PAYMENT SWITCH
          const PaymentSwitch(label: "Save card details"),

          const SizedBox(height: AppSizes.md * 2),

          /// PAYMENT BUTTON
          AuthButton(text: "Pay Now", onTap: openPopup),

          const SizedBox(height: AppSizes.xxl),
        ],
      ),
    );
  }
}
