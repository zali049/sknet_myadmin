import 'package:get/get.dart';
import 'package:sknet_myadmin/controllers/add_odp_controller.dart';
import 'package:sknet_myadmin/controllers/odp_controller.dart';
import 'package:sknet_myadmin/utils/connectivity.dart';

class DependencyInjection {
  static void init() {  
    Get.lazyPut(() => ConnectivityService());
    Get.lazyPut(() => OdpController());
    Get.lazyPut(()=>AddOdpController());
  }
}
