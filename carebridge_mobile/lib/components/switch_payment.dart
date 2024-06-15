import 'package:flutter/material.dart';

class PaymentSwitch extends StatefulWidget {
  final String label;
  const PaymentSwitch({super.key, required this.label});

  @override
  State<PaymentSwitch> createState() => _PaymentSwitchState();
}

class _PaymentSwitchState extends State<PaymentSwitch> {
  bool toggled = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SwitchListTile.adaptive(
          value: toggled,
          onChanged: (value) => setState(() => toggled = value),
          activeTrackColor: colorScheme.primary,
          activeColor: colorScheme.primary,
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
        Text(
          widget.label,
          style: textTheme.bodySmall!.copyWith(color: colorScheme.primary),
        )
      ],
    );
  }
}
