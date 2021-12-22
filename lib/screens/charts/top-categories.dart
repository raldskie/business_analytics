import 'package:business_analytics/models/Category.dart';
import 'package:business_analytics/utilities/mobile.dart';
import 'package:business_analytics/widgets/Text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Icons by svgrepo.com (https://www.svgrepo.com/collection/job-and-professions-3/)
class TopCategories extends StatefulWidget {
  const TopCategories({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TopCategories();
}

class _TopCategories extends State {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          label: "Categories with most establishments",
          isBold: true,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        !isMobile(context)
            ? Expanded(
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback:
                          (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 0,
                      sections: showingSections()),
                ),
              )
            : SizedBox(
              height: 300,
              child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(
                          touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 0,
                      sections: showingSections()),
                ),
            ),
      ],
    );
  }

  List<VCategory> categories = [
    VCategory(
        value: 20,
        title: '20%',
        photo:
            "https://visitour-staging.s3.ap-southeast-1.amazonaws.com/607564a97d84680d7f2b3a97/Icon/Icon_small.jpg",
        name: "Farms",
        color: Colors.yellow),
    VCategory(
        value: 10,
        title: '10%',
        photo:
            "https://visitour-staging.s3.ap-southeast-1.amazonaws.com/607564a97d84680d7f2b3a97/Icon/Icon_small.jpg",
        name: "Museum",
        color: Colors.blue),
    VCategory(
        value: 15,
        title: '15%',
        photo:
            "https://visitour-staging.s3.ap-southeast-1.amazonaws.com/607564a97d84680d7f2b3a97/Icon/Icon_small.jpg",
        name: "Accommodation",
        color: Colors.purple),
    VCategory(
        value: 10,
        title: '10%',
        photo:
            "https://visitour-staging.s3.ap-southeast-1.amazonaws.com/607564a97d84680d7f2b3a97/Icon/Icon_small.jpg",
        name: "Activities",
        color: Colors.red),
    VCategory(
        value: 20,
        title: '20%',
        photo:
            "https://visitour-staging.s3.ap-southeast-1.amazonaws.com/607564a97d84680d7f2b3a97/Icon/Icon_small.jpg",
        name: "Water Parks",
        color: Colors.pink),
    VCategory(
        value: 30,
        title: '30%',
        photo:
            "https://visitour-staging.s3.ap-southeast-1.amazonaws.com/607564a97d84680d7f2b3a97/Icon/Icon_small.jpg",
        name: "Food Services",
        color: Colors.green),
  ];

  List<PieChartSectionData> showingSections() {
    return List.generate(categories.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      VCategory category = categories[i];

      return PieChartSectionData(
        color: category.color,
        value: double.parse(category.value.toString()),
        title: category.title,
        radius: radius,
        titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff)),
        badgeWidget: _Badge(
          category.photo,
          size: widgetSize,
          borderColor: const Color(0xff0293ee),
        ),
        badgePositionPercentageOffset: .98,
      );
    });
  }
}

class _Badge extends StatelessWidget {
  final String photo;
  final double size;
  final Color borderColor;

  const _Badge(
    this.photo, {
    Key? key,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child:
                Image.network(photo, width: 50, height: 50, fit: BoxFit.fill)),
      ),
    );
  }
}
