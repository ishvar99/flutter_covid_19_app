import 'package:covid19app/providers/data.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import './DecoratedCircle.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

const url = 'https://covid19.mathdro.id/api/';

class DetailsCard extends StatefulWidget {
  final String label;
  final Color color;
  DetailsCard({this.label, this.color});

  @override
  _DetailsCardState createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  final formatter = new NumberFormat("#,###");
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
                colors: [widget.color, widget.color.withOpacity(0.2)],
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
                    color: widget.color,
                  ),
                  Consumer<AppData>(
                    builder: (context, data, child) {
                      return Text(
                        data.infected == 0
                            ? "Loading..."
                            : formatter.format(data.infected),
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w700,
                            color: widget.color),
                      );
                    },
                  ),
                  Text(widget.label.toUpperCase(),
                      style: TextStyle(
                          color: widget.color.withOpacity(0.8),
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
