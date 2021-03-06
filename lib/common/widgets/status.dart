import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final dynamic bgColor;
  final String statusText;
  const StatusWidget({required this.bgColor, required this.statusText});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(10)),
      child: Text(statusText),
    );
  }
}
