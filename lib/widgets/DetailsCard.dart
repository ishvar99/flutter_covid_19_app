import 'package:flutter/material.dart';
import '../constant.dart';
import './DecoratedCircle.dart';

class DetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4), blurRadius: 30, color: kShadowColor)
            ]),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  DecoratedCircle(
                    color: kInfectedColor,
                  ),
                  DecoratedCircle(color: kRecoverColor),
                  DecoratedCircle(
                    color: kDeathColor,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  '1046',
                  style: TextStyle(fontSize: 40, color: kInfectedColor),
                ),
                Text(
                  '1046',
                  style: TextStyle(fontSize: 40, color: kRecoverColor),
                ),
                Text(
                  '1046',
                  style: TextStyle(fontSize: 40, color: kDeathColor),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Infected',
                  style: kSubTextStyle,
                ),
                Text(
                  'Recovered',
                  style: kSubTextStyle,
                ),
                Text(
                  'Deaths',
                  style: kSubTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
