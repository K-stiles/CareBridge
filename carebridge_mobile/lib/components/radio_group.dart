import 'package:flutter/material.dart';

enum PatientResponse { yes, no }

class RadioOption extends StatelessWidget {
  final String title;
  final PatientResponse value;
  final PatientResponse? selectedPatientResponse;
  final void Function(PatientResponse?) onChanged;

  const RadioOption({
    super.key,
    required this.title,
    required this.value,
    required this.selectedPatientResponse,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: RadioListTile<PatientResponse>(
        title: Text(title),
        value: value,
        groupValue: selectedPatientResponse,
        onChanged: onChanged,
        contentPadding: EdgeInsets.zero,
        activeColor: colorScheme.primary,
      ),
    );
  }
}
