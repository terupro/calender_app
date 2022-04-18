import 'package:flutter/material.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    Key? key,
    required this.press,
  }) : super(key: key);

  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 10, bottom: 8),
      child: Container(
        height: 60,
        width: 70,
        child: Center(
          child: GestureDetector(
            onTap: press,
            child: const Text(
              '保存',
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFdcdcdc),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
