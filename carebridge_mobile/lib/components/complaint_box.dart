import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class ComplaintBox extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;

  const ComplaintBox({
    super.key,
    required this.controller,
    required this.validator,
    this.hintText = "complaint here...",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(flex: 1, child: Text("Complaint")),
        // SizedBox(width: 10),
        Expanded(
            flex: 3,
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                  // color: Colors.green,
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: controller,
                minLines: 1,
                maxLines: 10,
                validator: validator,
                // maxLength: 3000,

                // scrollPadding: EdgeInsets.zero,
                decoration: InputDecoration(
                  // filled: true,
                  // fillColor: Colors.amber,
                  hintText: hintText,

                  //errorBorder
                  errorBorder: const OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSizes.xs)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSizes.xs)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),

                  //enabledBorder
                  enabledBorder: const OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSizes.xs)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),

                  //focusedBorder
                  focusedBorder: const OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSizes.xs)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
