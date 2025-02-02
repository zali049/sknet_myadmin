import 'package:get/get.dart';
import 'package:sknet_myadmin/views/odp_pages/controller/odp_controller.dart';

class OdpPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OdpController(), fenix: true);
  }
}
