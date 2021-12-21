import 'package:business_analytics/models/Category.dart';
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
        Expanded(
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
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
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
        value: 40,
        title: '40%',
        photo:
            "https://visitour-staging.s3.ap-southeast-1.amazonaws.com/607564a97d84680d7f2b3a97/Icon/Icon_small.jpg",
        name: "Farms",
        color: Colors.yellow),
    VCategory(
        value: 60,
        title: '60%',
        photo:
            "https://visitour-staging.s3.ap-southeast-1.amazonaws.com/607564a97d84680d7f2b3a97/Icon/Icon_small.jpg",
        name: "Farms",
        color: Colors.blue)
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
