import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sknet_myadmin/views/odp_pages/controller/odp_controller.dart';
import 'package:sknet_myadmin/models/odp/odp_model.dart';
import 'package:sknet_myadmin/repository/odp_repo.dart';

class AddOdpController extends GetxController {

  
  @override
  void dispose() {
    super.dispose();
    cNama.dispose();
    cKode.dispose();
    cAlamat.dispose();
    cLong.dispose();
    cLat.dispose();
    cNoFeeder.dispose();
    cTube.dispose();
    cCore.dispose();
    cFeederOut.dispose();
    cRtoSplitter.dispose();
    cRedOut.dispose();
    cBlueOut.dispose();
    cSplitter.dispose();
    cSplitOut.dispose();
    cKeterangan.dispose();
  }

  final OdpController controller = Get.find();

  final OdpService _odpService = OdpService();
  final formKey = GlobalKey<FormState>();

  final TextEditingController cNama = TextEditingController();
  final TextEditingController cKode = TextEditingController(text: 'SK-ODP-');
  final TextEditingController cAlamat = TextEditingController();
  final TextEditingController cLong = TextEditingController();
  final TextEditingController cLat = TextEditingController();
  final TextEditingController cNoFeeder = TextEditingController();
  final TextEditingController cTube = TextEditingController();
  final TextEditingController cCore = TextEditingController();
  final TextEditingController cFeederOut = TextEditingController();
  final TextEditingController cRtoSplitter = TextEditingController();
  final TextEditingController cRedOut = TextEditingController();
  final TextEditingController cBlueOut = TextEditingController();
  final TextEditingController cSplitter = TextEditingController();
  final TextEditingController cSplitOut = TextEditingController();
  final TextEditingController cKeterangan = TextEditingController();

  String? validatorForm(String? value) {
    if (value!.isNotEmpty) {
      return null;
    } else {
      return 'form tidak boleh kosong';
    }
  }

  Future<void> sendDataOdp() async {
    var data = OdpModel(
        namaOdp: cNama.text,
        kodeOdp: cKode.text,
        addressOdp: cAlamat.text,
        longitude: cLong.text,
        latitude: cLat.text,
        noFeeder: cNoFeeder.text,
        tube: cTube.text,
        core: cCore.text,
        feederOut: cFeederOut.text,
        ratioSplitter: cRtoSplitter.text,
        ratioSplitRed: cRedOut.text,
        ratioSplitBlue: cBlueOut.text,
        splitter: cSplitter.text,
        splitterOut: cSplitOut.text,
        keterangan: cKeterangan.text);
    try {
      final response = await _odpService.createOdps(data);
      if (response == true) {
        Get.snackbar("Seccess", 'Data berhasil disimpan');
        Get.delete<AddOdpController>();
        controller.getOdpsAll();
      } else {
        Get.snackbar("Gagal", 'Data Gagal disimpan');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<bool?> updateData(int id, OdpModel model) async {
    return await _odpService.updateOdp(id, model);
  }
}
