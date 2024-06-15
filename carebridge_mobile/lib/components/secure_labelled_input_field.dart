import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

class SecureInput extends StatefulWidget {
  final String label;
  final String hintText;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const SecureInput({
    super.key,
    required this.controller,
    required this.validator,
    this.textInputAction = TextInputAction.next,
    this.label = "Password",
    this.hintText = "Atleast 8 characters",
  });

  @override
  State<SecureInput> createState() => _SecureInputState();
}

class _SecureInputState extends State<SecureInput> {
  bool secureText = true;
  // final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        /// label - Password
        Text(
          widget.label,
          style: textTheme.bodyMedium!.copyWith(color: Colors.grey.shade700),
        ),

        const SizedBox(height: 8),

        //Formtextfield
        TextFormField(
          controller: widget.controller,
          obscureText: secureText,
          keyboardType: TextInputType.text,
          textInputAction: widget.textInputAction,
          autocorrect: true,
          validator: widget.validator,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
          decoration: InputDecoration(
            filled: false,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),

            //suffix
            suffixIcon: IconButton(
              onPressed: () => setState(() => secureText = !secureText),
              icon: Icon(
                secureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey.shade400,
              ),
            ),

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
