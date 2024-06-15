import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      // Get.rawSnackbar(
      //   messageText: const Text(
      //     "PLEASSE CONNECT TO THE INTERNET",
      //     style: TextStyle(fontSize: 14, color: Colors.white),
      //   ),
      //   isDismissible: false,
      //   duration: const Duration(days: 1),
      //   backgroundColor: Colors.red.shade400,
      //   icon: const Icon(
      //     Icons.wifi_off,
      //     color: Colors.white,
      //     size: 32,
      //   ),
      //   margin: EdgeInsets.zero,
      //   snackStyle: SnackStyle.GROUNDED,
      // );

      Get.defaultDialog(
        title: 'Wi-Fi Connection',
        titlePadding: const EdgeInsets.all(20),
        contentPadding: const EdgeInsets.all(20),
        content: const Column(
          children: [
            Icon(Icons.wifi_off_rounded, size: 48, color: Colors.blue),
            SizedBox(height: 16),
            Text(
              'You are not connected to the internnet. Please check your network status.',
              textAlign: TextAlign.center,
            )
          ],
        ),
        confirm: ElevatedButton(onPressed: () {}, child: const Text('OK')),
        barrierDismissible: false,
      );
    } else {
      // Dialog is already open
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
      // if (Get.isSnackbarOpen) {
      //   Get.closeCurrentSnackbar();
      // }
    }
  }
}
