import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sknet_myadmin/controllers/add_odp_controller.dart';
import 'package:sknet_myadmin/pages/components/custom_button.dart';
import 'package:sknet_myadmin/pages/components/custom_text_field.dart';

class AddOdp extends StatelessWidget {
  AddOdp({
    super.key,
  });

  final AddOdpController controller = Get.put(AddOdpController());
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            width: 30.0,
            height: 3.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                8, 24, 8, MediaQuery.of(context).viewInsets.bottom + 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => Get.offAllNamed('/odp_page'),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    const Center(
                      child: Text(
                        "Add ODP",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: controller.cNama,
                      label: 'Nama ODP',
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      line: 1,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: controller.cKode,
                      label: 'Kode ODP',
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: controller.cAlamat,
                      label: 'Alamat',
                      line: 5,
                      alignLabel: true,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: controller.cLong,
                            label: "Longitudinal",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: controller.cLat,
                            label: "Latitude",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: controller.cTube,
                            label: "Tube",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: controller.cCore,
                            label: "Core",
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
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: controller.cFeederOut,
                            label: "Feeder Out",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: controller.cRtoSplitter,
                      label: 'Ratio Splitter',
                      line: 1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: controller.cRedOut,
                            label: "Red Out",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: controller.cBlueOut,
                            label: "Blue Out",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: controller.cSplitter,
                      label: ' Splitter',
                      line: 1,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: controller.cSplitOut,
                      label: 'Splitter Out',
                      line: 1,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: controller.cKeterangan,
                      label: 'Keterangan',
                      line: 5,
                      alignLabel: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        label: 'Simpan',
                        action: () {
                          controller.sendDataOdp();
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
