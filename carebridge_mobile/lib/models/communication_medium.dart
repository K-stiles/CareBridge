import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_rock_mobile/constants/app_colors.dart';
import 'package:the_rock_mobile/constants/app_images.dart';

class CommunicationMode {
  String title;
  SvgPicture icon;

  CommunicationMode({
    required this.title,
    required this.icon,
  });
}

List<CommunicationMode> communicationMode = [
  CommunicationMode(
    title: "Chat",
    icon: SvgPicture.asset(
      AppImages.call,
      fit: BoxFit.contain,
      height: 24,
      color: AppColors.carebridgePrimary,
    ),
  ),
  CommunicationMode(
      title: "Voice Call",
      icon: SvgPicture.asset(
        AppImages.video,
        fit: BoxFit.contain,
        height: 24,
        color: AppColors.carebridgePrimary,
      )),
  CommunicationMode(
    title: "Video Call",
    icon: SvgPicture.asset(
      AppImages.chat,
      fit: BoxFit.contain,
      height: 24,
      color: AppColors.carebridgePrimary,
    ),
  ),
];
