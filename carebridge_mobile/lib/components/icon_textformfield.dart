import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class IconInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double inputWidth;
  final double inputHeight;
  final String svg;

  const IconInputField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.label,
    required this.keyboardType,
    required this.svg,
    this.textInputAction = TextInputAction.next,
    this.inputHeight = AppSizes.xl + 5,
    this.inputWidth = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /** LABEL */
        Text(label, style: textTheme.bodySmall),
        const SizedBox(height: AppSizes.base_),

        /** INPUT  */
        SizedBox(
          height: inputHeight, // 60
          width: inputWidth,
          child: TextFormField(
            controller: controller,
            autocorrect: false,
            // obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            validator: validator,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),

              //prefixIcon
              prefixIcon: Container(
                height: double.infinity,
                width: AppSizes.xl,
                margin: const EdgeInsets.only(right: AppSizes.sm),
                decoration: BoxDecoration(
                  color: colorScheme.secondary.withOpacity(0.15),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.xs),
                    bottomLeft: Radius.circular(AppSizes.xs),
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    svg,
                    fit: BoxFit.contain,
                    height: 30,
                  ),
                ),
                //  IconButton(
                //   onPressed: onPressed,
                //   icon: Icon(Icons.person, color: colorScheme.primary),
                // ),
              ),

              //enabledBorder
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(Radius.circular(AppSizes.xs)),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),

              //focusedBorder
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(Radius.circular(AppSizes.xs)),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
