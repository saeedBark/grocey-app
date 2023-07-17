import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final bool isTitle;
  final int maxLines;
  const TextWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.fontSize,
    this.isTitle = false,
    this.maxLines = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal),
    );
  }
}
