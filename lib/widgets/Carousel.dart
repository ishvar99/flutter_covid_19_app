import 'package:covid19app/widgets/PaginationDots.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatefulWidget {
  final List<Widget> cardList;
  Carousel({@required this.cardList});
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PaginationDots(
          cardList: widget.cardList,
          currentIndex: _currentIndex,
        ),
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
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
          items: widget.cardList.map((card) {
            return Builder(builder: (BuildContext context) {
              return card;
            });
          }).toList(),
        ),
      ],
    );
  }
}
