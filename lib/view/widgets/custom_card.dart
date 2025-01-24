import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      this.child,
      this.title,
      this.decription,
      this.backgrounColor,
      this.img,
      this.colorList, this.height, this.width});

  final double? height;
  final double? width;
  final String? title;
  final String? decription;
  final List<Color>? colorList;
  final Color? backgrounColor;
  final Widget? child;
  final Image? img;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: width,
        height: height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: backgrounColor,
          borderRadius: BorderRadius.circular(15.0),
          // color: Colors.amber,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Divider(
                height: 1,
                endIndent: 10,
              ),
              const SizedBox(height: 10),
              Text(
                decription ?? "",
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
