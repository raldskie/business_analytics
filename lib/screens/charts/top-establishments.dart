import 'package:business_analytics/models/Establishment.dart';
import 'package:business_analytics/utilities/mobile.dart';
import 'package:business_analytics/utilities/themes.dart';
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
        visitorsPerDay: "538"),
    Establishment(
        name: "Bukidnon Brew Café",
        location: "Fortitch Street",
        photo:
            "https://lh5.googleusercontent.com/p/AF1QipPTJaV6NmizjM4zyLnZnLeH89zURSZpAXKgD9Po=w400-h300-k-no",
        visitorsPerDay: "452"),
    Establishment(
        name: "Le Café",
        location: "Fortitch Street",
        photo:
            "https://currentlyaddictedto.files.wordpress.com/2015/06/le-cafe-malaybalay.jpg",
        visitorsPerDay: "444"),
    Establishment(
        name: "Busy Bean Café",
        location: "Fortitch Street",
        photo:
            "https://www.bukidnononline.com/wp-content/uploads/2019/08/busy-bean-study-cafe-1024x576.jpg",
        visitorsPerDay: "438"),
    Establishment(
        name: "Meow Café",
        location: "Fortitch Street",
        photo:
            "https://1.bp.blogspot.com/-rgBk40OPd74/YAkUm8UcMVI/AAAAAAAAKvM/SekUewqhkEgIDvnuITcOWdmNoxAhBkzMQCLcBGAsYHQ/s960/m3.jpg",
        visitorsPerDay: "437"),
    Establishment(
        name: "Del Rio's Cafe",
        location: "Fortitch Street",
        photo:
            "https://lh5.googleusercontent.com/p/AF1QipN-t7DYiZrahAL6mK-zPIa0V85dcXC_hFLG5fIx=w500-h500-k-no",
        visitorsPerDay: "399"),
    Establishment(
        name: "Estudyo M Cafe",
        location: "Fortitch Street",
        photo:
            "https://lh3.googleusercontent.com/-SmFr0LeKsHY/XX4et08VU2I/AAAAAAAGsy8/bIN42YpCyWUXY3VZQdGZc5Hlmc8ARxYcwCLIBGAYYCw/w768-h768-n-o-k-v1/",
        visitorsPerDay: "390"),
    Establishment(
        name: "Abbey Café",
        location: "Fortitch Street",
        photo: "https://10619-2.s.cdn12.com/rests/original/110_508838981.jpg",
        visitorsPerDay: "347"),
    Establishment(
        name: "YAKĀ",
        location: "Fortitch Street",
        photo:
            "https://www.bukidnononline.com/wp-content/uploads/2017/09/yaka-malaybalay-restaurant.jpg",
        visitorsPerDay: "321"),
    Establishment(
        name: "Cafe Cassanova",
        location: "Fortitch Street",
        photo:
            "https://scontent.fdvo2-1.fna.fbcdn.net/v/t39.30808-6/241522106_4470791309704115_4559364569222466660_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=e3f864&_nc_eui2=AeGj5XB3DwtzO4ZPIm6MOaZHoFo5BQ4qjsmgWjkFDiqOybUtDniMtqg3P7otAZGXI6JyGA4-bq7KVhIaQTMmzn5D&_nc_ohc=telDp5uXTTgAX_XqPV1&_nc_ht=scontent.fdvo2-1.fna&oh=00_AT-Qp2utIK_ZCZW3dg-9fqVQYURgU0h8DZsS8gkpBvD6Lg&oe=61C75260",
        visitorsPerDay: "319"),
    Establishment(
        name: "Galleria Food Art",
        location: "Fortitch Street",
        photo:
            "https://lh3.googleusercontent.com/p/AF1QipPShRpNiYlc5pJzE5OM4_WwYxawuXljkE1bE24k=s1600-w400",
        visitorsPerDay: "303"),
    Establishment(
        name: "Waterpool Microtel",
        location: "Fortitch Street",
        photo:
            "https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_1300,q_auto,w_2000/itemimages/42/00/4200862.jpeg",
        visitorsPerDay: "260"),
    Establishment(
        name: "Kaamulan Park",
        location: "Fortitch Street",
        photo:
            "https://cdn.bitlanders.com/users/galleries/389959/389959_gallery_550922268e9d6_jpg_fa_rszd.jpg",
        visitorsPerDay: "233"),
    Establishment(
        name: "18.	Patio Alexandria",
        location: "Fortitch Street",
        photo: "https://menu.sluurpy.com/immagini/locali/thumbs/7102944.jpg",
        visitorsPerDay: "225"),
  ];
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
            label: "Visits per day (Average)",
            isBold: true,
            color: Colors.white,
          ),
          SizedBox(
            height: 15,
          ),
          !isMobile(context)
              ? Expanded(
                  child: ListView.builder(
                      itemCount: topEstablishments.length,
                      itemBuilder: (context, index) => EstablishmentItem(
                          establishment: topEstablishments[index])))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: topEstablishments.length,
                  itemBuilder: (context, index) => EstablishmentItem(
                      establishment: topEstablishments[index])),
        ],
      ),
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
        margin: EdgeInsets.symmetric(vertical: 5),
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
          Container(
            width: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: MyTheme.PRIMARY_COLOR_850,
                borderRadius: BorderRadius.circular(3)),
            child: MyText(
              label: establishment.visitorsPerDay,
              color: Colors.white,
              isBold: true,
              size: 30,
            ),
          )
        ]));
  }
}
