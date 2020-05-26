import 'package:carousel_slider/carousel_slider.dart';
import 'package:covid19app/utilities/networkHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../widgets/dropDownList.dart';
import '../widgets/DetailsCard.dart';
import '../constant.dart';

const url = 'https://covid19.mathdro.id/api/';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = true;
  int _currentIndex = 0;
  int infected_cases = 0;
  int recovered_cases = 0;
  int death_cases = 0;
  NetworkHelper helper = NetworkHelper(url: url);
  setNumberOfCases() async {
    var data = await helper.getData();
    setState(() {
      infected_cases = data['confirmed']['value'];
      recovered_cases = data['recovered']['value'];
      death_cases = data['deaths']['value'];
      _isLoading = false;
    });
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setNumberOfCases();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List cardList = [
      DetailsCard(
        color: kInfectedColor,
        label: "confirmed",
        cases: infected_cases,
      ),
      DetailsCard(
          color: kRecoverColor, label: "recovered", cases: recovered_cases),
      DetailsCard(color: kDeathColor, label: "deaths", cases: death_cases)
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
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
                        Expanded(child: DropDownList()),
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
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          pauseAutoPlayOnTouch: true,
                          viewportFraction: 0.9,
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
              Container(
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 8,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
                  ),
                ),
                color: Colors.black.withOpacity(_isLoading ? 0.5 : 1.0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
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
