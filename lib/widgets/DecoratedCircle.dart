import 'package:flutter/material.dart';

class DecoratedCircle extends StatelessWidget {
  final Color color;
  DecoratedCircle({this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        color: color.withOpacity(.26),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 2)),
        ),
      ),
    );
  }
}
