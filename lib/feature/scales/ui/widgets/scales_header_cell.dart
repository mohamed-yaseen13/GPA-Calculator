import 'package:flutter/material.dart';

class ScalesHeaderCell extends StatelessWidget {
  String text;
  ScalesHeaderCell({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
