import 'package:get/get.dart';
import 'package:sknet_myadmin/models/odp/odp_model.dart';
import 'package:sknet_myadmin/repository/odp_repo.dart';

class OdpController extends GetxController {
  final OdpService _odpService = OdpService();
  final listOdp = <OdpModel>[].obs;
  final isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    getOdpsAll();
  }

  @override
  onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2), () {
      listOdp.refresh();
    });
  }

  Future<void> handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    getOdpsAll();
  }

  Future<void> getOdpsAll() async {
    isLoading.value = true;
    try {
      listOdp.value = await _odpService.getOdps();
    } catch (e) {
      //
    } finally {
      isLoading.value = false;
    }
  }

  void deleteItemOdp(int id) async {
    await _odpService.deleteOdps(id);
    Get.snackbar('Delete Success', "Data Berhasil di hapus");
    getOdpsAll();
    Get.back();
  }

  // Future<void> deleteItemOdp(int id) async {
  //   try {
  //     await _odpService.deleteOdps(id)
  //     getOdpsAll();
  //   } catch (e) {}
  // }
}
