// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;

  const Heading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Text(
      text,
      textAlign: TextAlign.center,
      style: textTheme.headlineLarge!.copyWith(color: colorScheme.primary),
    );
  }
}
