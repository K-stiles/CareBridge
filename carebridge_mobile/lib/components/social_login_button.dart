import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  final void Function()? onTilePressed;
  final String tileImage;
  
  const SocialLogin({
    super.key,
    required this.onTilePressed,
    required this.tileImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTilePressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey)),
        child: Image.asset(
          tileImage,
          height: 35,
          width: 40,
        ),
      ),
    );
  }
}
