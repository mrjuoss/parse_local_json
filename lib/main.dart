import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:parse_local_json/country.dart';
import 'package:parse_local_json/list.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parse Local Json'),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/country.json'),
            builder: (context, snapshot) {
              List<Country> countries = parseJson(snapshot.data.toString());
              return !countries.isEmpty
                  ? new CountryList(country: countries)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  List<Country> parseJson(String responseBody) {
    if (responseBody == null) {
      return [];
    }

    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Country>((json) => Country.fromJson(json)).toList();
  }
}
