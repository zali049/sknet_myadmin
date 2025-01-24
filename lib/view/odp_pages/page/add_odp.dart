import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sknet_myadmin/view/odp_pages/controller/add_odp_controller.dart';
import 'package:sknet_myadmin/view/widgets/custom_button.dart';
import 'package:sknet_myadmin/view/widgets/custom_maps.dart';
import 'package:sknet_myadmin/view/widgets/custom_text_field.dart';

class AddOdp extends StatefulWidget {
  const AddOdp({
    super.key,
    this.arguments,
  });

  final dynamic arguments;

  @override
  State<AddOdp> createState() => _AddOdpState();
}

class _AddOdpState extends State<AddOdp> {
  @override
  void initState() {
    super.initState();
    _alignPositionOnUpdate = AlignOnUpdate.always;
    _alignPositionStreamController = StreamController<double?>();
  }

  @override
  void dispose() {
    super.dispose();
    _alignPositionStreamController.close();
  }

  final controller = Get.find<AddOdpController>();
  late AlignOnUpdate _alignPositionOnUpdate;
  late StreamController<double?> _alignPositionStreamController;
  Marker? marker;

  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      controller.cLat.text = position.latitude.toString();
      controller.cLong.text = position.longitude.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
                Get.delete<AddOdpController>();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            const Spacer(),
            const Center(
              child: Text(
                "Add ODP",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CustomMaps(
                              options: MapOptions(
                                initialZoom: 12.0,
                                interactionOptions: const InteractionOptions(
                                    flags: InteractiveFlag.pinchZoom |
                                        InteractiveFlag.drag),
                                onTap: (tapPosition, point) {
                                  setState(() {
                                    marker = Marker(
                                      height: 40,
                                      width: 40,
                                      point: point,
                                      child: const Icon(
                                        Icons.location_pin,
                                        size: 50,
                                        color: Colors.blue,
                                      ),
                                    );
                                    controller.cLat.text =
                                        point.latitude.toStringAsPrecision(9);
                                    controller.cLong.text =
                                        point.longitude.toString();
                                  });
                                },
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  userAgentPackageName:
                                      'my.id.zalidev.sknetadmin',
                                ),
                                MarkerLayer(
                                    markers: marker != null ? [marker!] : []),
                                CurrentLocationLayer(
                                  alignPositionStream:
                                      _alignPositionStreamController.stream,
                                  alignPositionOnUpdate: _alignPositionOnUpdate,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.blue,
                                        elevation: 10,
                                        onPressed: () {
                                          setState(() {
                                            _alignPositionOnUpdate =
                                                AlignOnUpdate.always;
                                            getLocation();
                                          });

                                          _alignPositionStreamController
                                              .add(18);
                                        },
                                        child: const Icon(
                                          Icons.my_location,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: controller.cLong,
                                label: "Longitudinal",
                                inputType: TextInputType.number,
                                inputAction: TextInputAction.next,
                                validator: controller.validatorForm,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomTextField(
                                controller: controller.cLat,
                                label: "Latitude",
                                inputType: TextInputType.number,
                                inputAction: TextInputAction.next,
                                validator: controller.validatorForm,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: controller.cNama,
                          label: 'Nama ODP',
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          line: 1,
                          validator: controller.validatorForm,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: controller.cKode,
                          label: 'Kode ODP',
                          inputType: TextInputType.number,
                          inputAction: TextInputAction.next,
                          validator: controller.validatorForm,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: controller.cAlamat,
                          label: 'Alamat',
                          line: 5,
                          alignLabel: true,
                          inputType: TextInputType.streetAddress,
                          validator: controller.validatorForm,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: controller.cTube,
                                label: "Tube",
                                inputType: TextInputType.number,
                                inputAction: TextInputAction.next,
                                validator: controller.validatorForm,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomTextField(
                                controller: controller.cCore,
                                label: "Core",
                                inputType: TextInputType.number,
                                inputAction: TextInputAction.next,
                                validator: controller.validatorForm,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: controller.cNoFeeder,
                                label: "Feeder",
                                inputType: TextInputType.number,
                                inputAction: TextInputAction.next,
                                validator: controller.validatorForm,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomTextField(
                                controller: controller.cFeederOut,
                                label: "Feeder Out",
                                inputType: TextInputType.number,
                                inputAction: TextInputAction.next,
                                validator: controller.validatorForm,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: controller.cRtoSplitter,
                          label: 'Ratio Splitter',
                          line: 1,
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          validator: controller.validatorForm,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: controller.cRedOut,
                                label: "Red Out",
                                inputType: TextInputType.number,
                                inputAction: TextInputAction.next,
                                validator: controller.validatorForm,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomTextField(
                                controller: controller.cBlueOut,
                                label: "Blue Out",
                                inputType: TextInputType.number,
                                inputAction: TextInputAction.next,
                                validator: controller.validatorForm,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: controller.cSplitter,
                          label: ' Splitter',
                          line: 1,
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          validator: controller.validatorForm,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: controller.cSplitOut,
                          label: 'Splitter Out',
                          line: 1,
                          inputType: TextInputType.number,
                          inputAction: TextInputAction.next,
                          validator: controller.validatorForm,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: controller.cKeterangan,
                          label: 'Keterangan',
                          line: 5,
                          alignLabel: true,
                          validator: controller.validatorForm,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            label: 'Simpan',
                            action: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.sendDataOdp();
                                Get.back();
                              } else {
                                return;
                              }
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
