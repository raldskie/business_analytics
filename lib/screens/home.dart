import 'package:business_analytics/screens/charts/availed-offers.dart';
import 'package:business_analytics/screens/charts/monthly-visitors.dart';
import 'package:business_analytics/screens/charts/page-clicks.dart';
import 'package:business_analytics/screens/charts/top-categories.dart';
import 'package:business_analytics/screens/charts/top-establishments.dart';
import 'package:business_analytics/screens/responsive/desktop.dart';
import 'package:business_analytics/screens/responsive/mobile.dart';
import 'package:business_analytics/utilities/mobile.dart';
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
    return isMobile(context) ? Mobile() : Desktop();
  }


}
