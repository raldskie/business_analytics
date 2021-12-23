import 'package:business_analytics/utilities/mobile.dart';
import 'package:business_analytics/utilities/themes.dart';
import 'package:business_analytics/widgets/Text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PageClicks extends StatefulWidget {
  PageClicks({Key? key}) : super(key: key);

  @override
  _PageClicksState createState() => _PageClicksState();
}

class _PageClicksState extends State<PageClicks> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return _LineChart(isShowingMainData: isShowingMainData);
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: MyTheme.PRIMARY_COLOR, borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            label: "Page clicks",
            isBold: true,
            color: Colors.white,
          ),
          SizedBox(
            height: 15,
          ),
          Row(children: [
            Legend(color: Colors.red, name: "Search"),
            Legend(color: Color(0xffaa4cfc), name: "Home Feed"),
            Legend(color: Color(0xff4af699), name: "Referrals/Links"),
          ]),
          SizedBox(
            height: 30,
          ),
          !isMobile(context)
              ? Expanded(
                  child: LineChart(
                    sampleData1,
                    swapAnimationDuration: const Duration(milliseconds: 250),
                  ),
                )
              : SizedBox(
                  height: 300,
                  child: LineChart(
                    sampleData1,
                    swapAnimationDuration: const Duration(milliseconds: 250),
                  ),
                ),
        ],
      ),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 14,
        maxY: 4,
        minY: 0,
      );
  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: bottomTitles,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: leftTitles(
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '100k';
              case 2:
                return '200k';
              case 3:
                return '300k';
              case 4:
                return '400k';
            }
            return '';
          },
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
        lineChartBarData1_3,
      ];

  SideTitles leftTitles({required GetTitleFunction getTitles}) => SideTitles(
        getTitles: getTitles,
        showTitles: true,
        margin: 8,
        interval: 1,
        reservedSize: 40,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff75729e),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 22,
        margin: 10,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff72719b),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return 'SEPT';
            case 7:
              return 'OCT';
            case 12:
              return 'DEC';
          }
          return '';
        },
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xff4e4965), width: 4),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        colors: [const Color(0xff4af699)],
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(7, 3),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        colors: [const Color(0xffaa4cfc)],
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false, colors: [
          const Color(0x00aa4cfc),
        ]),
        spots: const [
          FlSpot(1, 3),
          FlSpot(3, 3.2),
          FlSpot(7, 2.6),
          FlSpot(10, 2.8),
          FlSpot(12, 3.5),
          FlSpot(13, 3.3),
        ],
      );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        colors: const [Colors.red],
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 0.8),
          FlSpot(3, 1),
          FlSpot(6, 2),
          FlSpot(10, 1.3),
          FlSpot(13, 2.5),
        ],
      );
}

class Legend extends StatelessWidget {
  Legend({Key? key, required this.color, required this.name}) : super(key: key);

  Color color;
  String name;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        color: color,
        height: 12,
        width: 12,
      ),
      SizedBox(width: 5),
      MyText(
        label: name,
        color: Colors.white,
        size: 12,
      ),
      SizedBox(width: 15),
    ]);
  }
}
