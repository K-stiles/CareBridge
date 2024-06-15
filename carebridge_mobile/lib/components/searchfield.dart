import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String hintText;

  const SearchField({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: appWidth * 0.85,
      child: TextField(
        onChanged: onChanged,
        autocorrect: false,
        style: TextStyle(fontSize: 14, color: Colors.grey.shade900),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade100,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),

          //search
          prefixIcon: const Icon(Icons.search_rounded, size: 28),

          //enabledBorder
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),

          //focusedBorder
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey.shade500),
          ),
        ),
      ),
    );
  }
}
