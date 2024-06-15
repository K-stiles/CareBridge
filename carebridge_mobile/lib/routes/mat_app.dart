import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:the_rock_mobile/constants/current_user.dart';
import 'package:the_rock_mobile/constants/themes.dart';
import 'package:the_rock_mobile/controllers/call_helper.dart';
import 'package:the_rock_mobile/main.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class MatApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const MatApp({
    super.key,
    required this.navigatorKey,
  });

  @override
  State<MatApp> createState() => _MatAppState();
}

class _MatAppState extends State<MatApp> {
  @override
  void initState() {
    super.initState();

    if (currentUser.id.isNotEmpty) {
      onUserLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);

    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      // designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'Purple Care Mobile App',
        debugShowCheckedModeBanner: false,
        // themeMode: themeProvider.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        navigatorKey: widget.navigatorKey,
        home: defaultHome,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: [
              child!,

              /// support minimizing
              ZegoUIKitPrebuiltCallMiniOverlayPage(
                contextQuery: () {
                  return widget.navigatorKey.currentState!.context;
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
