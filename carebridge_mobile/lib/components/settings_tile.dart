import 'package:flutter/material.dart';

class SettingsTile extends StatefulWidget {
  final String title;
  final String subtitle;
  const SettingsTile({super.key, required this.title, required this.subtitle});

  @override
  State<SettingsTile> createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  bool toggled = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SwitchListTile.adaptive(
      title: Text(
        widget.title,
        style: textTheme.displaySmall!.copyWith(color: colorScheme.primary),
      ),
      subtitle: Text(
        widget.subtitle,
        style: textTheme.bodySmall!.copyWith(color: Colors.grey.shade600),
      ),
      value: toggled,
      onChanged: (value) {
        setState(() {
          toggled = value;
        });
      },
      activeTrackColor: colorScheme.primary,
      activeColor: colorScheme.primary,
      // dense: true,
      contentPadding: EdgeInsets.zero,
    );
  }
}
