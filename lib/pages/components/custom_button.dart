import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.action, required this.label});

  final VoidCallback action;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        side: const BorderSide(
          color: Colors.black,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide.none
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
