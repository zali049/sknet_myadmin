import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:sknet_myadmin/controllers/add_odp_controller.dart';

class CustomMaps extends StatefulWidget {
  const CustomMaps({
    super.key,
  });

  @override
  State<CustomMaps> createState() => _CustomMapsState();
}

class _CustomMapsState extends State<CustomMaps> {
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

  final AddOdpController controller = Get.find<AddOdpController>();
  final LatLng _latLng = const LatLng(0, 0);
  Marker? marker;
  late AlignOnUpdate _alignPositionOnUpdate;

  late StreamController<double?> _alignPositionStreamController;

  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      controller.cLat.text = position.latitude.toString();
      controller.cLong.text = position.longitude.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: _latLng,
        initialZoom: 12.0,
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
            controller.cLat.text = point.latitude.toStringAsPrecision(9);
            controller.cLong.text = point.longitude.toString();
          });
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'my.id.zalidev.sknetadmin',
        ),
        MarkerLayer(markers: marker != null ? [marker!] : []),
        CurrentLocationLayer(
          alignPositionStream: _alignPositionStreamController.stream,
          alignPositionOnUpdate: _alignPositionOnUpdate,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 40,
              width: 40,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: FloatingActionButton(
                backgroundColor: Colors.blue,
                elevation: 10,
                onPressed: () {
                  setState(() {
                    _alignPositionOnUpdate = AlignOnUpdate.always;
                    getLocation();
                  });

                  _alignPositionStreamController.add(18);
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
    );
  }
}
