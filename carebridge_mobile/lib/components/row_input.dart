import 'package:flutter/material.dart';
import 'package:the_rock_mobile/components/icon_textformfield.dart';

// import 'icon_textformfield.dart';

class RowInput extends StatelessWidget {
  final String leftlabel;
  final String rightlabel;
  final String lefthintText;
  final String righthintText;
  final String leftsvg;
  final String rightsvg;
  final TextEditingController leftcontroller;
  final TextEditingController rightcontroller;
  const RowInput({
    super.key,
    required this.leftlabel,
    required this.rightlabel,
    required this.lefthintText,
    required this.righthintText,
    required this.leftsvg,
    required this.rightsvg,
    required this.leftcontroller,
    required this.rightcontroller,
  });

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /** INPUTFIELD 1 */
        IconInputField(
          label: leftlabel,
          hintText: lefthintText,
          controller: leftcontroller,
          inputWidth: appWidth * 0.4,
          keyboardType: TextInputType.name,
          svg: leftsvg,
          validator: (data) {
            if (data!.isEmpty) {
              return "$leftlabel field cannot be empty";
            } else {
              return null;
            }
          },
        ),
        /** INPUTFIELD 2 */
        IconInputField(
          label: rightlabel,
          hintText: righthintText,
          controller: rightcontroller,
          inputWidth: appWidth * 0.4,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.done,
          svg: rightsvg,
          validator: (data) {
            if (data!.isEmpty) {
              return "$rightlabel field cannot be empty";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
