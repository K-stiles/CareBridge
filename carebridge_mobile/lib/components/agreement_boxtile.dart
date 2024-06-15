import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_rock_mobile/screens/app/privacy_and_security.dart';
import 'package:the_rock_mobile/screens/app/terms_and_conditions.dart';
// import 'package:the_rock_mobile/screens/app/privacy_and_security.dart';
// import 'package:the_rock_mobile/screens/app/terms_and_conditions.dart';

class AgreementBoxTile extends StatelessWidget {
  final bool? value;
  final Color color;
  final void Function(bool?)? onChanged;

  const AgreementBoxTile({
    super.key,
    required this.value,
    required this.color,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xff1e81b0),
          checkColor: Colors.white,
          side: BorderSide(color: color, width: 2),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => const TermsAndConditions());
                },
                child: RichText(
                  maxLines: 2,
                  text: TextSpan(
                      style: TextStyle(color: Colors.grey.shade900),
                      children: const [
                        TextSpan(text: "I've read and agree with "),
                        TextSpan(
                          text: "Terms of Service",
                          style: TextStyle(
                            color: Color(0xff1e81b0),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ]),
                ),
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: " and ",
                      style: TextStyle(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const PrivacyAndSecurity());
                    },
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                          style: TextStyle(color: Colors.grey.shade900),
                          children: const [
                            TextSpan(
                              text: " and our Privacy Policy",
                              style: TextStyle(
                                color: Color(0xff1e81b0),
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
