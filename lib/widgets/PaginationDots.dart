import 'package:flutter/material.dart';
import '../constant.dart';

class PaginationDots extends StatelessWidget {
  final cardList;
  final currentIndex;
  PaginationDots({this.cardList, this.currentIndex});

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: map<Widget>(cardList, (index, url) {
        return Container(
          width: 10.0,
          height: 10.0,
          margin: EdgeInsets.symmetric(horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index ? kPrimaryColor : Colors.grey,
          ),
        );
      }),
    );
  }
}
