import 'package:covid19app/utilities/networkHelper.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../providers/data.dart';

const url = 'https://covid19.mathdro.id/api';

class DropDownList extends StatefulWidget {
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  AppData appData;
  List countriesList = [];
  String dropDownValue = 'Global';

  Future<void> fetchCountriesData() async {
    var targetUrl;
    appData.infected = 0;
    appData.recovered = 0;
    appData.deaths = 0;

    if (dropDownValue == 'Global') {
      targetUrl = '$url';
    } else {
      targetUrl = '$url/countries/$dropDownValue';
    }
    NetworkHelper network = NetworkHelper(url: targetUrl);
    var data = await network.getData();
    appData.infected = data['confirmed']['value'];
    appData.recovered = data['recovered']['value'];
    appData.deaths = data['deaths']['value'];
    appData.lastUpdated = data['lastUpdate'];
  }

  Future<void> fetchCountriesList() async {
    NetworkHelper network = NetworkHelper(url: '$url/countries');
    var data = await network.getData();
    List countries = data['countries'].map((country) {
      return country['name'];
    }).toList();
    countriesList = countries;
  }

  getCountriesList() async {
    await fetchCountriesList();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCountriesList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appData = Provider.of<AppData>(context);
    return DropdownButton<String>(
      value: dropDownValue,
      icon: SvgPicture.asset('assets/icons/dropdown.svg'),
      underline: SizedBox(),
      isExpanded: true,
      items: ['Global', ...countriesList].map((var value) {
        return DropdownMenuItem(
          value: value.toString(),
          child: Text(value),
        );
      }).toList(),
      onChanged: (val) async {
        setState(() {
          dropDownValue = val;
        });
        await fetchCountriesData();
      },
    );
  }
}
