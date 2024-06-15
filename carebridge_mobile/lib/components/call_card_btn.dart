import 'package:flutter/material.dart';

class CallCardBtn extends StatelessWidget {
  final Widget icon;
  final Color background;
  final void Function()? onTap;
  const CallCardBtn({
    super.key,
    required this.icon,
    required this.background,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(50),
        ),
        child: icon,
      ),
    );
  }
}
