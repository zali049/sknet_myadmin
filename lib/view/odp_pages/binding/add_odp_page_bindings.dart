import 'package:get/get.dart';
import 'package:sknet_myadmin/view/odp_pages/controller/add_odp_controller.dart';

class AddOdpPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddOdpController(),
      fenix: true,
    );
  }
}
