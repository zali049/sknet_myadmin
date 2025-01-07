import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sknet_myadmin/models/odp_model.dart';
import 'package:sknet_myadmin/repo/odp_repo.dart';

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

  //OdpController controller = Get.find();

  final OdpService _odpService = OdpService();

  final TextEditingController cNama = TextEditingController();
  final TextEditingController cKode = TextEditingController();
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

  Future<void> sendDataOdp() async {
    var request = OdpModel(
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
      final response = await _odpService.createOdps(request);
      if (response == true) {
        Get.snackbar("Seccess", 'Data berhasil disimpan');
        // controller.getOdpsAll();
      } else {
        Get.snackbar("Gagal", 'Data Gagal disimpan');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
