
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';


class CustomMaps extends StatefulWidget {
  const CustomMaps(
      {super.key, required this.children, this.options});

  final List<Widget> children;
  final MapOptions? options;

  @override
  State<CustomMaps> createState() => _CustomMapsState();
}

class _CustomMapsState extends State<CustomMaps> {
  Marker? marker;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      // ignore: prefer_const_constructors
      options: widget.options ?? MapOptions(),
      
      children: widget.children,
    );
  }
}
