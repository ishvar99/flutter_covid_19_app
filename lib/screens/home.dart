import 'package:covid19app/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ClipPath(
          clipper: MyClipper(),
          child: Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/virus.png')),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF3383CD),
                  Color(0xFF11249F),
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset('assets/icons/menu.svg'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: SvgPicture.asset(
                          'assets/icons/Drcorona.svg',
                          alignment: Alignment.topCenter,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 180,
                        child: Text(
                          'All you need \nis stay at home',
                          style: kHeadingTextStyle.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      Container()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
