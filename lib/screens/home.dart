import 'package:business_analytics/screens/charts/availed-offers.dart';
import 'package:business_analytics/screens/charts/monthly-visitors.dart';
import 'package:business_analytics/screens/charts/page-clicks.dart';
import 'package:business_analytics/screens/charts/top-categories.dart';
import 'package:business_analytics/screens/charts/top-establishments.dart';
import 'package:business_analytics/utilities/themes.dart';
import 'package:business_analytics/widgets/Header.dart';
import 'package:business_analytics/widgets/Text.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.PRIMARY_COLOR_850,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(children: [
          MyHeader(name: "Stephen Strange"),
          Expanded(
              child: Row(children: [
            Placeholder(
              label: "Most availed offers",
              child: AvailedOffers(),
            ),
            SizedBox(
              width: 20,
            ),
            Placeholder(
              label: "Page clicks",
              child: PageClicks(),
            ),
            SizedBox(
              width: 20,
            ),
            Placeholder(
              label: "Top categories",
              child: TopCategories(),
            )
          ])),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Row(children: [
            Placeholder(
              flex: 2,
              label: "Monthly visitors",
              child: MonthlyVisitors(),
            ),
            SizedBox(
              width: 20,
            ),
            Placeholder(label: "Top establishments", child: TopEstablishments())
          ])),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}

class Placeholder extends StatelessWidget {
  Placeholder({Key? key, required this.label, this.flex, this.child})
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
