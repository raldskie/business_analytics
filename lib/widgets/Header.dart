import 'package:business_analytics/utilities/mobile.dart';
import 'package:business_analytics/widgets/Text.dart';
import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  MyHeader({Key? key, required this.name}) : super(key: key);

  String name;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        if (!isMobile(context))
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: AssetImage('assets/img/logo-color.png'),
                width: 150,
                height: 150,
              )),
        Padding(
          padding: EdgeInsets.only(top: isMobile(context) ? 25 : 0),
          child: Row(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  image: AssetImage('assets/img/user.jpg'),
                  width: 50,
                  height: 50,
                )),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  label: name,
                  isBold: true,
                  size: 18,
                  color: Colors.white,
                ),
                MyText(
                  label: "LGU Malaybalay Admin",
                  color: Colors.white70,
                )
              ],
            )
          ]),
        )
      ]),
    );
  }
}
