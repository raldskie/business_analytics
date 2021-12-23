import 'package:business_analytics/screens/charts/availed-offers.dart';
import 'package:business_analytics/screens/charts/monthly-visitors.dart';
import 'package:business_analytics/screens/charts/page-clicks.dart';
import 'package:business_analytics/screens/charts/top-categories.dart';
import 'package:business_analytics/screens/charts/top-establishments.dart';
import 'package:business_analytics/utilities/themes.dart';
import 'package:business_analytics/widgets/Header.dart';
import 'package:business_analytics/widgets/Placeholder.dart';
import 'package:flutter/material.dart';

class Mobile extends StatefulWidget {
  Mobile({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Mobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.PRIMARY_COLOR_850,
      body: ListView(padding: EdgeInsets.symmetric(horizontal: 20), children: [
        MyHeader(name: "Stephen Strange"),
        AvailedOffers(),
        SizedBox(
          height: 20,
        ),
        PageClicks(),
        SizedBox(
          height: 20,
        ),
        TopCategories(),
        SizedBox(
          height: 20,
        ),
        MonthlyVisitors(),
        SizedBox(
          height: 20,
        ),
        TopEstablishments(),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
