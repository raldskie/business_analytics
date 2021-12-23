import 'package:business_analytics/screens/charts/availed-offers.dart';
import 'package:business_analytics/screens/charts/monthly-visitors.dart';
import 'package:business_analytics/screens/charts/page-clicks.dart';
import 'package:business_analytics/screens/charts/top-categories.dart';
import 'package:business_analytics/screens/charts/top-establishments.dart';
import 'package:business_analytics/utilities/themes.dart';
import 'package:business_analytics/widgets/Header.dart';
import 'package:business_analytics/widgets/Placeholder.dart';
import 'package:flutter/material.dart';

class Desktop extends StatefulWidget {
  Desktop({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Desktop> {
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
            Expanded(child: AvailedOffers()),
            SizedBox(
              width: 20,
            ),
            Expanded(child: PageClicks()),
            SizedBox(
              width: 20,
            ),
            Expanded(child: TopCategories()),
          ])),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Row(children: [
            Expanded(flex: 2, child: MonthlyVisitors()),
            SizedBox(
              width: 20,
            ),
            Expanded(child: TopEstablishments())
          ])),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
