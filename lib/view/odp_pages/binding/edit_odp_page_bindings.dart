
import 'package:get/get.dart';
import 'package:sknet_myadmin/view/odp_pages/controller/edit_odp_controller.dart';

class EditOdpPageBindings extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut(
      () => EditOdpController(),
      fenix: true,
    );
  }
}