import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sknet_myadmin/core/http_api/http_api.dart';
import 'package:sknet_myadmin/models/odp/odp_model.dart';

class OdpService {
  final ApiClient _apiClient = ApiClient();
  String message = "";
  bool? isAddSuccess;

  Future<List<OdpModel>> getOdps() async {
    final response = await _apiClient.getOdp();
    List<OdpModel> listOdp = <OdpModel>[];
    try {
      if (response.status == true) {
        listOdp = response.data!;
      } else {
        message = response.messages ?? "";
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return listOdp;
  }

  Future<bool?> createOdps(OdpModel model) async {
    final res = await _apiClient.addOdp(model);
    try {
      if (res.status == true) {
        message = res.messages ?? "";
        return isAddSuccess = true;
      } else {
        message = res.messages ?? "";
      }
    } catch (e) {
      message = "Error ${e.toString()} ${res.status.toString()}";
      isAddSuccess = false;
    }
    return isAddSuccess;
  }

  Future<void> deleteOdps(int id) async {
    try {
      await _apiClient.deleteOdp(id);
      Get.snackbar('Sukses', 'User berhasil dihapus');
    } catch (e) {
      Get.snackbar('Gagal', 'Gagal menghapus user');
    }
  }

  Future<bool?> updateOdp(int id, OdpModel model) async {
    bool? isSuccess;
    try {
      final res = await _apiClient.updateOdp(id, model);
      if (res.status == true) {
        isSuccess = true;
        Get.snackbar("Success Update Data", "Berhasil Melakukan Update data");
        
        message = res.messages ?? "";
      } else if(res.status == false ){
        Get.snackbar("Gagal Update Data", "Gagal Melakukan Update data");
        message = res.status.toString() + res.messages!;
      }
      return isSuccess;
    } catch (e) {
      message = e.toString();
      Get.snackbar("Gagal Update Data", message, duration: Duration(minutes: 3));
      print(message);
    }
    return isSuccess;
  }
}
