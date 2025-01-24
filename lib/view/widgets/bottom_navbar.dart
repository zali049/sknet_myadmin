import 'package:flutter/material.dart';
import 'package:sknet_myadmin/utils/constans.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key, required this.children, this.height, });
  final List<Widget> children;
  final double? height;
  
  @override
  Widget build(BuildContext context) {
    Constans.init(context);

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(24),
        height: height,
        width: Constans.deviceWidth,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  blurRadius: 20,
                  offset: const Offset(0, 20))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children,
        ),
      ),
    );
  }
}
