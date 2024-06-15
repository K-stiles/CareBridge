import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:the_rock_mobile/constants/app_preference.dart';
import 'package:the_rock_mobile/constants/current_user.dart';
import 'package:the_rock_mobile/screens/app/doctor/doc_app.dart';
import 'package:the_rock_mobile/screens/app/patient/app.dart';
import 'package:the_rock_mobile/screens/onboarding/exports.dart';

import 'package:the_rock_mobile/providers/exports.dart';
import 'package:the_rock_mobile/routes/mat_app.dart';
import 'package:the_rock_mobile/utility/dependency_injection.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

Widget defaultHome = const Onboarding();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Future.delayed(const Duration(seconds: 4));
  FlutterNativeSplash.remove();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final entryPoint = prefs.getBool(AppPreference.entryPoint) ?? false;
  final loggedIn = prefs.getBool(AppPreference.loggedIn) ?? false;
  final isPatient = prefs.getBool(AppPreference.isPatient) ?? false;
  final callerId = prefs.getString(AppPreference.callerId) ?? '';
  final callername = prefs.getString(AppPreference.callername) ?? '';

  if (entryPoint && !loggedIn) {
    defaultHome = const GettingStarted();
  } else if (entryPoint && loggedIn) {
    defaultHome = isPatient ? const App() : const Docapp();
  }

  if (callerId.isNotEmpty && callername.isNotEmpty) {
    currentUser.id = callerId;
    currentUser.name = callername;
  }

  final navigatorKey = GlobalKey<NavigatorState>();

  /// 2/5: set navigator key to ZegoUIKitPrebuiltCallInvitationService
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => OnBoardNotifier()),
          ChangeNotifierProvider(create: (context) => LoginNotifier()),
          ChangeNotifierProvider(create: (context) => SignUpNotifier()),
          ChangeNotifierProvider(create: (context) => OfferedServiceNotifier()),
          ChangeNotifierProvider(create: (context) => SpecializationNotifier()),
          ChangeNotifierProvider(create: (context) => ImageUploaderNotifier()),
          ChangeNotifierProvider(create: (context) => ProfileNotifier()),
          ChangeNotifierProvider(create: (context) => MedicalsNotifier()),
          ChangeNotifierProvider(create: (context) => AppointmentNotifier()),
        ],
        child: MatApp(navigatorKey: navigatorKey),
      ),
    );
  });

  DependencyInjection.init();
}
