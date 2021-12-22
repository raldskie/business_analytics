import 'package:business_analytics/utilities/themes.dart';
import 'package:business_analytics/widgets/Text.dart';
import 'package:flutter/material.dart';

class MyPlaceholder extends StatelessWidget {
  MyPlaceholder({Key? key, required this.label, this.flex, this.child})
      : super(key: key);

  String label;
  int? flex;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: Container(
        padding: EdgeInsets.all(15),
        height: double.infinity,
        child: child ??
            MyText(
              label: label,
              isBold: true,
              color: Colors.white,
            ),
        decoration: BoxDecoration(
            color: MyTheme.PRIMARY_COLOR,
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}