import 'package:flutter/material.dart';

class DocStatus extends StatelessWidget {
  final bool online;
  const DocStatus({super.key, required this.online});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: online ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
