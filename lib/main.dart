import 'dart:convert';

import 'package:cryptoprice/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: Firstpage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(buttonTheme: ButtonThemeData()),
  ));
}

String cointype = 'inr';
Future<List> getdata() async {
  var req = await http.get(Uri.parse(
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=' +
          cointype));

  List result = json.decode(req.body) as List;

  return result;
}

class Firstpage extends StatefulWidget {
  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("crypto coin price"),
        actions: [],
      ),
      body: Container(
        child: FutureBuilder<List>(
          future: getdata(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError)
              return Center(child: Text(snapshot.error.toString()));
            return snapshot.hasData
                ? buildlist(snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

Widget buildlist(var data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Detailpage(),
                    settings: RouteSettings(arguments: [data, index])));
          },
          leading: Text(data[index]['market_cap_rank'].toString()),
          trailing: data[index]['price_change_percentage_24h'] > 0
              ? Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.green,
                )
              : Icon(
                  Icons.arrow_downward_rounded,
                  color: Colors.red,
                ),
          title: Text(data[index]['name'] + ' - ' + data[index]['symbol']),
          subtitle: Text('₹ ' + data[index]['current_price'].toString()),
        );
      });
}
