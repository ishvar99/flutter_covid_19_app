import 'package:covid19app/providers/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant.dart';

class Header extends StatelessWidget {
  final label;
  Header({@required this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          label,
          style: kTitleTextstyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Consumer<AppData>(
              builder: (context, data, child) => Text(
                'Last Updated: ${data.lastUpdated}',
                style: TextStyle(color: kTextLightColor),
              ),
            ),
            Text(
              'see details',
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
            )
          ],
        )
      ]),
    );
  }
}
