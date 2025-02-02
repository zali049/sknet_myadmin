import 'package:get/get.dart';
import 'package:sknet_myadmin/views/home_pages/controller/home_controller.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
      fenix: true,
    );
  }
}
