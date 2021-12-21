import 'package:business_analytics/models/Establishment.dart';
import 'package:business_analytics/widgets/Text.dart';
import 'package:flutter/material.dart';

class TopEstablishments extends StatefulWidget {
  TopEstablishments({Key? key}) : super(key: key);

  @override
  _TopEstablishmentsState createState() => _TopEstablishmentsState();
}

class _TopEstablishmentsState extends State<TopEstablishments> {
  List<Establishment> topEstablishments = [
    Establishment(
        name: "Kan anan sa umahan",
        location: "P-1 Violeta",
        photo:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRioEI4ukddcJtBu_a_D5oMI49OLkLSBXPyNw&usqp=CAU",
        visitorsPerDay: "247")
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          label: "Visits per day",
          isBold: true,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: topEstablishments.length,
                itemBuilder: (context, index) => EstablishmentItem(
                    establishment: topEstablishments[index]))),
      ],
    );
  }
}

// ignore: must_be_immutable
class EstablishmentItem extends StatelessWidget {
  EstablishmentItem({Key? key, required this.establishment}) : super(key: key);

  Establishment establishment;

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.network(establishment.photo,
                height: 40, width: 40, fit: BoxFit.fill)),
        SizedBox(
          width: 10,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          MyText(
            label: establishment.name,
            color: Colors.white,
            isBold: true,
          ),
          MyText(
            label: establishment.location,
            color: Colors.white60,
          )
        ]),
      ]),
      MyText(
        label: establishment.visitorsPerDay,
        color: Colors.white,
        isBold: true,
        size: 30,
      )
    ]));
  }
}
