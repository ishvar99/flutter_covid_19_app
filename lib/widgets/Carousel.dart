import 'package:covid19app/widgets/PaginationDots.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../constant.dart';
import '../widgets/DetailsCard.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;
  List<Widget> _cardList = [
    DetailsCard(
      color: kInfectedColor,
      label: "confirmed",
    ),
    DetailsCard(color: kRecoverColor, label: "recovered"),
    DetailsCard(
      color: kDeathColor,
      label: "deaths",
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PaginationDots(
          cardList: _cardList,
          currentIndex: _currentIndex,
        ),
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            viewportFraction: 0.9,
            enableInfiniteScroll: false,
            aspectRatio: 1.8,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: _cardList.map((card) {
            return Builder(builder: (BuildContext context) {
              return card;
            });
          }).toList(),
        ),
      ],
    );
  }
}
