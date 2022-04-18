import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.label,
    required this.contentPadding,
    required this.changed,
    this.controller,
  }) : super(key: key);

  final String label;
  final EdgeInsetsGeometry contentPadding;
  final ValueChanged changed;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlignVertical: TextAlignVertical.top,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        filled: true,
        fillColor: Colors.white,
        hintText: label,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
      onChanged: changed,
    );
  }
}
