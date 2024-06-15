import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/app_colors.dart';
import 'package:the_rock_mobile/screens/app/exports.dart';
import 'package:the_rock_mobile/screens/app/patient/account_doctor.dart';
import 'package:the_rock_mobile/screens/onboarding/getting_started.dart';

class SettingsOptions {
  String title;
  String subtitle;
  Widget icon;
  Widget screen;
  bool logout;
  bool share;

  SettingsOptions({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.screen,
    this.logout = false,
    this.share = false,
  });
}

List<SettingsOptions> settingsOptions = [
  SettingsOptions(
    title: "Account",
    subtitle: "Manage your account here",
    screen: const PatientAccountSettings(),
    icon: const Icon(Icons.person, color: AppColors.carebridgePrimary),
  ),
  SettingsOptions(
    title: "Appointments",
    subtitle: "Manage your appointments here",
    screen: const Appointments(),
    icon: const Icon(
        color: AppColors.carebridgePrimary,
        FluentIcons.briefcase_medical_24_filled),
  ),
  SettingsOptions(
    title: "Favorite Doctors",
    subtitle: "Your favorite doctors",
    screen: const FavoriteDoctors(),
    icon: const Icon(
        color: AppColors.carebridgePrimary, FluentIcons.stethoscope_24_filled),
  ),
  SettingsOptions(
    title: "Subscriptions",
    subtitle: "Doctors and services you subscribe to",
    screen: const Subscriptions(),
    icon: const Icon(
        color: AppColors.carebridgePrimary, FluentIcons.contact_card_24_filled),
  ),
  SettingsOptions(
    title: "Settings",
    subtitle: "Manage your app experience here",
    screen: const Settings(),
    icon: const Icon(
        color: AppColors.carebridgePrimary, FluentIcons.settings_24_filled),
  ),
  SettingsOptions(
    title: "Share App",
    subtitle: "Enjoying the App, share it with your friends.",
    screen: const GettingStarted(),
    share: true,
    icon:
        const Icon(color: AppColors.carebridgePrimary, FluentIcons.share_24_filled),
  ),
  SettingsOptions(
    title: "Logout",
    subtitle: "Logout of the Ark App",
    screen: const GettingStarted(),
    logout: true,
    icon: const Icon(
        color: AppColors.carebridgePrimary, FluentIcons.sign_out_24_filled),
  ),
];

List<SettingsOptions> settingsDocOptions = [
  SettingsOptions(
    title: "Account",
    subtitle: "Manage your account here",
    screen: const DoctorAccountSettings(),
    icon: const Icon(Icons.person, color: AppColors.carebridgePrimary),
  ),
  SettingsOptions(
    title: "Availability",
    subtitle: "Manage your availability here",
    screen: const Appointments(),
    icon: const Icon(
        color: AppColors.carebridgePrimary, FluentIcons.calendar_28_filled),
  ),
  SettingsOptions(
    title: "Settings",
    subtitle: "Manage your app experience here",
    screen: const Settings(),
    icon: const Icon(
        color: AppColors.carebridgePrimary, FluentIcons.settings_24_filled),
  ),
  SettingsOptions(
    title: "Logout",
    subtitle: "Logout of the Ark App",
    screen: const GettingStarted(),
    logout: true,
    icon: const Icon(
        color: AppColors.carebridgePrimary, FluentIcons.sign_out_24_filled),
  ),
];
