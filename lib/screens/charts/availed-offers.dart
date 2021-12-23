import 'package:business_analytics/utilities/mobile.dart';
import 'package:business_analytics/utilities/themes.dart';
import 'package:business_analytics/widgets/Text.dart';
import 'package:flutter/material.dart';

class AvailedOffers extends StatefulWidget {
  AvailedOffers({Key? key}) : super(key: key);

  @override
  _AvailedOffersState createState() => _AvailedOffersState();
}

class _AvailedOffersState extends State<AvailedOffers> {
  @override
  Widget build(BuildContext context) {
    return !isMobile(context)
        ? Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: MyTheme.PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      label: "Most availed offers",
                      isBold: true,
                      color: Colors.white,
                    ),
                    MyText(
                      label: "November",
                      isBold: true,
                      color: Colors.blueAccent[200],
                    ),
                  ],
                )),
                Column(children: [
                  Row(children: [
                    OfferItem(
                        icon: 'assets/img/hotel.png',
                        name: 'Accomm.',
                        stat: '30k'),
                    SizedBox(width: 10),
                    OfferItem(
                        icon: 'assets/img/store.png',
                        name: 'Products',
                        stat: '18.6k'),
                  ]),
                  SizedBox(height: 10),
                  Row(children: [
                    OfferItem(
                        icon: 'assets/img/guide.png',
                        name: 'Tours',
                        stat: '5k'),
                    SizedBox(width: 10),
                    OfferItem(
                        icon: 'assets/img/menu.png',
                        name: 'Food',
                        stat: '44.6k'),
                  ]),
                  SizedBox(height: 10),
                  Row(children: [
                    OfferItem(
                        icon: 'assets/img/truck.png',
                        name: 'Transpo.',
                        stat: '23.1k'),
                    SizedBox(width: 10),
                    OfferItem(
                        icon: 'assets/img/package.png',
                        name: 'Packages',
                        stat: '27.6k'),
                  ])
                ]),
              ],
            ))
        : Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: MyTheme.PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(5)),
            child: Column(children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      label: "Most availed offers",
                      isBold: true,
                      color: Colors.white,
                    ),
                    MyText(
                      label: "November",
                      isBold: true,
                      color: Colors.blueAccent[200],
                    )
                  ]),
              SizedBox(height: 15),
              Column(children: [
                Row(children: [
                  OfferItem(
                      icon: 'assets/img/hotel.png',
                      name: 'Accomm.',
                      stat: '30k'),
                  SizedBox(width: 15),
                  OfferItem(
                      icon: 'assets/img/store.png',
                      name: 'Products',
                      stat: '18.6k'),
                ]),
                SizedBox(height: 15),
                Row(children: [
                  OfferItem(
                      icon: 'assets/img/guide.png', name: 'Tours', stat: '5k'),
                  SizedBox(width: 15),
                  OfferItem(
                      icon: 'assets/img/menu.png', name: 'Food', stat: '44.6k'),
                ]),
                SizedBox(height: 15),
                Row(children: [
                  OfferItem(
                      icon: 'assets/img/truck.png',
                      name: 'Transpo.',
                      stat: '23.1k'),
                  SizedBox(width: 15),
                  OfferItem(
                      icon: 'assets/img/package.png',
                      name: 'Packages',
                      stat: '27.6k'),
                ])
              ]),
            ]),
          );
  }
}

class OfferItem extends StatelessWidget {
  OfferItem(
      {Key? key, required this.icon, required this.name, required this.stat})
      : super(key: key);

  String icon;
  String name;
  String stat;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: MyTheme.PRIMARY_COLOR_850,
            borderRadius: BorderRadius.circular(5)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image(
              image: AssetImage(icon),
              width: 25,
              height: 25,
            ),
            SizedBox(height: 5),
            MyText(
              label: name,
              color: Colors.white,
            ),
          ]),
          MyText(
            label: stat,
            color: Colors.blueAccent[200],
            size: 18,
            isBold: true,
          )
        ]),
      ),
    );
  }
}
