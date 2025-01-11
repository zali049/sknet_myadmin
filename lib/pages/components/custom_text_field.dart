import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.inputType,
    this.inputAction,
    this.line,
    this.alignLabel,
    this.validator,
  });

  final String label;
  final TextEditingController controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final int? line;
  final bool? alignLabel;
  final FormFieldValidator<String>? validator;


 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      textInputAction: inputAction,
      validator:  validator,
      maxLines: line,
      decoration: InputDecoration(
        label: Text(label),
        //hintText: label,
        alignLabelWithHint: alignLabel,
        hintStyle: TextStyle(color: Colors.grey[400]),
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 3.0,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
