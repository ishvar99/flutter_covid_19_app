import 'package:covid19app/utilities/networkHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const url = 'https://covid19.mathdro.id/api/countries';

class DropDownList extends StatefulWidget {
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  List countriesList = [];
  String dropDownValue = 'Global';
  Future<void> operateData() async {
    NetworkHelper network = NetworkHelper(url: url);
    var data = await network.getData();
    List countries = data['countries'].map((country) {
      return country['name'];
    }).toList();
    countriesList = countries;
  }

  getCountriesList() async {
    await operateData();
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
      onChanged: (val) {
        setState(() {
          dropDownValue = val;
        });
      },
    );
  }
}
