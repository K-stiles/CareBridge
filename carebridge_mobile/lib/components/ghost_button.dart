import 'package:flutter/material.dart';

class GhostButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final String type;

  const GhostButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.type = "default"});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
