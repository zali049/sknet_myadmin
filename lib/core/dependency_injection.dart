import 'package:get/get.dart';
import 'package:sknet_myadmin/controllers/odp_controller.dart';
import 'package:sknet_myadmin/utils/connectivity.dart';

class DependencyInjection {
  static void init() {
    Get.put<ConnectivityService>(ConnectivityService(), permanent: true);
    Get.put<OdpController>(OdpController(), permanent: true);
  }
}
