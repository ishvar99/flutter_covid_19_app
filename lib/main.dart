import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './constant.dart';
import './screens/home.dart';
import './providers/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: 'Poppins',
          textTheme: TextTheme(
            body1: TextStyle(color: kBodyTextColor),
          )),
      home:
          ChangeNotifierProvider(create: (context) => AppData(), child: Home()),
    ));
  }
}
