import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  MyText(
      {Key? key,
      required this.label,
      this.isBold,
      this.opacity,
      this.size,
      this.color});

  String label;
  bool? isBold;
  double? opacity;
  double? size;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: opacity ?? 1,
        child: Text(label,
            style: TextStyle(
                color: color ?? Colors.black87,
                fontSize: size ?? 15,
                fontWeight:
                    isBold ?? false ? FontWeight.bold : FontWeight.normal)));
  }
}
