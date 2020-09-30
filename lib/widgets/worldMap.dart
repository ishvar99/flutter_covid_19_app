import 'package:flutter/material.dart';
import '../constant.dart';

class WorldMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Card(
        margin: EdgeInsets.only(bottom: 20),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: double.infinity,
          height: 175,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.08, 0.08],
                colors: [kPrimaryColor, Colors.blueAccent.withOpacity(0.2)],
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 30,
                  color: kShadowColor,
                ),
              ],
              borderRadius: BorderRadius.circular(20.0)),
          child: Image.asset(
            'assets/images/map.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
