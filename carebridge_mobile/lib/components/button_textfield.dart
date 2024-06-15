import 'package:flutter/material.dart';

class ButtonTextField extends StatelessWidget {
  final String hintText;
  final void Function()? onTap;

  const ButtonTextField({
    super.key,
    required this.hintText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
          height: 55,
          width: appWidth * 0.85,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Colors.grey.shade300, width: 1.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Icon(
                  Icons.search_rounded,
                  size: 28,
                  color: Colors.grey.shade500,
                ),
                const SizedBox(width: 10),
                Text(
                  hintText,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                ),
              ],
            ),
          )),
    );
  }
}
