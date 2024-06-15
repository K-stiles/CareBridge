import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class ComplaintTextArea extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const ComplaintTextArea(
      {super.key, required this.controller, required this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        // color: Colors.green,
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        minLines: 1,
        maxLines: 10,
        autocorrect: false,
        // maxLength: 3000,
        validator: validator,

        // scrollPadding: EdgeInsets.zero,
        decoration: const InputDecoration(
          // filled: true,
          // fillColor: Colors.amber,
          hintText: "Please type here ...",
          //enabledBorder
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSizes.xs)),
            borderSide: BorderSide(color: Colors.transparent),
          ),

          //focusedBorder
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSizes.xs)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
