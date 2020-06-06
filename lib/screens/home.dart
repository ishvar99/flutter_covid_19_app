import 'package:covid19app/utilities/networkHelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/LoadingBackdrop.dart';
import '../providers/data.dart';
import '../widgets/dropDownList.dart';
import '../constant.dart';
import '../widgets/Carousel.dart';
import '../widgets/header.dart';

const url = 'https://covid19.mathdro.id/api/';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppData appData;
  bool _isLoading = true;
  NetworkHelper helper = NetworkHelper(url: url);

  Future<void> setNumberOfCases(AppData appData) async {
    var data = await helper.getData();
    setState(() {
      appData.infected = data['confirmed']['value'];
      appData.recovered = data['recovered']['value'];
      appData.deaths = data['deaths']['value'];
      appData.lastUpdated = data['lastUpdate'];
      _isLoading = false;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      appData = Provider.of<AppData>(context);
      setNumberOfCases(appData);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => setNumberOfCases(appData),
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
                        Expanded(
                          child: DropDownList(),
                        ),
                      ],
                    ),
                  ),
                  Header(
                    label: 'Case Update',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Carousel(),
                  Header(
                    label: "Spread of Virus",
                  )
                ],
              ),
              _isLoading ? LoadingBackdrop() : Container()
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
