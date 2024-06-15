import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  final String text;

  const Paragraph({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      text,
      textAlign: TextAlign.center,
      style: textTheme.bodyLarge!.copyWith(
        color: Colors.grey[700],
      ),
    );
  }
}
