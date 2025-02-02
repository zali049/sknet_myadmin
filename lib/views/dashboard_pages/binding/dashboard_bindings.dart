import 'package:get/get.dart';
import 'package:sknet_myadmin/views/dashboard_pages/controller/dashboard_controller.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DashboardController(),
      fenix: true,
    );
  }
}
