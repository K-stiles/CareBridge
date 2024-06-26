import 'package:get/get.dart';
import 'package:the_rock_mobile/controllers/network_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
