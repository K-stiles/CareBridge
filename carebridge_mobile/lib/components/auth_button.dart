import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final bool outline;
  final bool showLoader;

  const AuthButton({
    super.key,
    required this.onTap,
    required this.text,
    this.showLoader = false,
    this.outline = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: outline ? Colors.transparent : colorScheme.primary,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: colorScheme.primary)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showLoader
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2),
                    )
                  : const SizedBox(width: 0.1),
              const SizedBox(width: 10),
              Text(text,
                  style: TextStyle(
                      fontSize: 18,
                      color: outline ? colorScheme.primary : Colors.white,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
