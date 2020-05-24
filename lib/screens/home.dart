import 'package:covid19app/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/virus.png')),
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
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Container()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFFE5E5E5))),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/icons/maps-and-flags.svg',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      value: 'India',
                      icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                      underline: SizedBox(),
                      isExpanded: true,
                      items: ['India', 'Australia', 'USA', 'UK']
                          .map((String dropdownitem) {
                        return DropdownMenuItem(
                          value: dropdownitem,
                          child: Text(dropdownitem),
                        );
                      }).toList(),
                      onChanged: (val) {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Case Update',
                      style: kTitleTextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Newest Update May 24',
                          style: TextStyle(color: kTextLightColor),
                        ),
                        Text(
                          'see details',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor)
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
