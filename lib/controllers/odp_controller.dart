import 'package:get/get.dart';
import 'package:sknet_myadmin/models/odp_model.dart';
import 'package:sknet_myadmin/repo/odp_repo.dart';

class OdpController extends GetxController {
  final OdpService _odpService = OdpService();
  final _listOdp = <OdpModel>[].obs;
  final _isLoading = false.obs;


  List<OdpModel> get odps => _listOdp;
  bool get isLoading => _isLoading.value;


  @override
  onInit() {
    super.onInit();
    getOdpsAll();
  }

  Future<void> getOdpsAll() async {
    _isLoading.value = true;
    try {
      _listOdp.value = await _odpService.getOdps();
    } catch (e) {
      //
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    // Update the list of items and refresh the UI
    getOdpsAll();
  }
}
