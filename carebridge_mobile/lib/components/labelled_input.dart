import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class LabelledInputField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final bool showPrivacy;
  final String hintText;
  final bool autofocus;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final void Function()? onPressed;
  final String? Function(String?)? validator;

  const LabelledInputField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.label,
    required this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.onPressed,
    this.obscureText = false,
    this.showPrivacy = false,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        //label
        Text(
          label,
          style: textTheme.bodyMedium!.copyWith(color: Colors.grey.shade700),
          // style: const TextStyle(fontWeight: FontWeight.w500),
        ),

        const SizedBox(height: 8),

        //Formtextfield
        TextFormField(
          controller: controller,
          autofocus: autofocus,
          autocorrect: false,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          textInputAction: textInputAction,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
          decoration: InputDecoration(
            filled: false,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),

            /// icon infront of input
            // icon: Icon(Icons.mail),

            //suffix
            suffixIcon: showPrivacy
                ? IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey.shade400,
                    ),
                  )
                : null,

            //error
            // errorText: "dynamic error message here",
            errorStyle: const TextStyle(fontSize: 14, color: Colors.redAccent),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.xs)),
              borderSide: BorderSide(color: Colors.redAccent),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.xs)),
              borderSide: BorderSide(color: Colors.redAccent),
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
              borderSide: BorderSide(color: Colors.grey.shade500),
            ),
          ),
        )
      ],
    );
  }
}
