import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/DetailsCard.dart';
import '../constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List cardList = [
    DetailsCard(
      color: kInfectedColor,
      label: "INFECTED",
      cases: 784309,
    ),
    DetailsCard(
      color: kRecoverColor,
      label: "RECOVERED",
      cases: 29045,
    ),
    DetailsCard(
      color: kDeathColor,
      label: "DEATHS",
      cases: 3404,
    )
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
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
                                fit: BoxFit.cover,
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
                            .map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
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
              SizedBox(
                height: 15,
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(cardList, (index, url) {
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? kPrimaryColor
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      aspectRatio: 1.7,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: cardList.map((card) {
                      return Builder(builder: (BuildContext context) {
                        return card;
                      });
                    }).toList(),
                  ),
                ],
              )
            ],
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
