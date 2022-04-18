import 'package:flutter/material.dart';

class DateSettingWidget extends StatelessWidget {
  const DateSettingWidget({
    Key? key,
    required this.label,
    required this.child,
  }) : super(key: key);

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ListTile(
        leading: Text(label),
        trailing: child,
      ),
    );
  }
}
