import 'package:flutter/material.dart';
import 'package:parse_local_json/country.dart';

class CountryList extends StatelessWidget {
  final List<Country> country;
  CountryList({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: country == null ? 0 : country.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(country[index].name),
                  Text('Capital : ' + country[index].capital),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
