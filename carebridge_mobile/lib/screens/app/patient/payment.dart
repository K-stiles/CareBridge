import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_rock_mobile/components/app_bar.dart';
import 'package:the_rock_mobile/components/ink_button.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/payment_options_menu.dart';
import 'package:the_rock_mobile/screens/app/patient/payment_screen_option_one.dart';
import 'package:the_rock_mobile/screens/app/patient/payment_screen_option_three.dart';
import 'package:the_rock_mobile/screens/app/patient/payment_screen_option_two.dart';

// import '../../models/payment_options_menu.dart';
// import 'payment_screen_option_one.dart';
// import 'payment_screen_option_three.dart';
// import 'payment_screen_option_two.dart';

class Payment extends StatefulWidget {
  static const String namedRoute = "/payment";

  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void goBack() => Navigator.pop(context);

    // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    // final TextEditingController nameController = TextEditingController();
    // final TextEditingController emailController = TextEditingController();
    // final TextEditingController inputController = TextEditingController();

    // void submit() {
    // final isValidForm = formKey.currentState!.validate();
    // if (isValidForm) {
    /***  submit to server */
    // print("all input fields are valid");
    // Navigator.of(context).pushNamed(BrowsePackages.namedRoute);
    // }
    // }

    List<Widget> paymentOptionsScreen = [
      const PaymentOptionOne(),
      const PaymentOptionTwo(),
      const PaymentOptionThree(),
    ];

    return Scaffold(
      body: Column(children: <Widget>[
        /// app bar
        PurpleAppBar(
          height: appHeight * .15,
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

                SizedBox(width: appWidth * 0.28),

                /// title
                Text(
                  "Payment",
                  style: textTheme.displayMedium!.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        /// MAIN BODY
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(AppSizes.md),
            children: <Widget>[
              const Text("Payment options", textAlign: TextAlign.center),

              const SizedBox(height: AppSizes.md),

              /// CARD OPTIONS
              Container(
                height: AppSizes.xl + 25,
                padding: const EdgeInsets.symmetric(vertical: AppSizes.xs),
                child: Center(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: paymentOptions.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: AppSizes.lg);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      /// BUTTONS
                      return GestureDetector(
                        onTap: () => setState(() => currentScreen = index),
                        child: Container(
                          padding: const EdgeInsets.all(AppSizes.base_),
                          decoration: BoxDecoration(
                            color: currentScreen == index
                                ? colorScheme.primary.withOpacity(0.1)
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(AppSizes.xs),
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                currentScreen == index
                                    ? paymentOptions[index].activeSvg
                                    : paymentOptions[index].inactiveSvg,
                                fit: BoxFit.contain,
                                height: 25,
                              ),
                              const SizedBox(height: AppSizes.xs),
                              Text(
                                paymentOptions[index].label,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: currentScreen == index
                                      ? colorScheme.primary
                                      : Colors.grey.shade800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.md),

              Text(
                "Enter details",
                textAlign: TextAlign.center,
                style:
                    textTheme.bodySmall!.copyWith(color: Colors.grey.shade600),
              ),

              /// DYNAMIC FORM BODY
              Container(child: paymentOptionsScreen[currentScreen]),
            ],
          ),
        ),
      ]),
    );
  }
}
