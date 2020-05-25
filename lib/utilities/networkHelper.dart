import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper({@required this.url});
  Future getData() async {
    var response = await http.get(url);
    var decodedData = json.decode(response.body);
    return decodedData;
  }
}
