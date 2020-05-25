import 'package:flutter/material.dart';
import '../constant.dart';
import './DecoratedCircle.dart';
import 'package:intl/intl.dart';

class DetailsCard extends StatelessWidget {
  final String label;
  final Color color;
  final int cases;
  final formatter = new NumberFormat("#,###");
  DetailsCard({this.label, this.color, this.cases});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.08, 0.08],
                colors: [color, color.withOpacity(0.2)],
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4), blurRadius: 30, color: kShadowColor)
              ]),
          child: Center(
            child: FittedBox(
              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DecoratedCircle(
                    color: color,
                  ),
                  Text(
                    formatter.format(cases),
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        color: color),
                  ),
                  Text(label,
                      style: TextStyle(
                          color: color.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
