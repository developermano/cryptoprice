import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  @override
  _DetailpageState createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    final List data = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
        appBar: AppBar(
          title: Text(data[0][data[1]]['name'].toString()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Listinfo(
                  data: data, rt: 'market cap rank', lt: 'market_cap_rank'),
              Listinfo(data: data, rt: 'symbol', lt: 'symbol'),
              Listinfo(data: data, rt: 'currency name', lt: 'name'),
              Listinfo(data: data, rt: 'current price', lt: 'current_price'),
              Listinfo(data: data, rt: 'market cap', lt: 'market_cap'),
              Listinfo(data: data, rt: 'total volume', lt: 'total_volume'),
              Listinfo(data: data, rt: 'high 24h', lt: 'high_24h'),
              Listinfo(data: data, rt: 'low 24h', lt: 'low_24h'),
              Listinfo(
                  data: data,
                  rt: 'circulating supply',
                  lt: 'circulating_supply'),
              Listinfo(data: data, rt: 'total supply', lt: 'total_supply'),
              Listinfo(data: data, rt: 'max_supply', lt: 'max_supply'),
              Listinfo(data: data, rt: 'All-Time High', lt: 'ath'),
              Listinfo(
                  data: data,
                  rt: 'all-time high change percentage',
                  lt: 'ath_change_percentage'),
              Listinfo(data: data, rt: 'ath_date', lt: 'ath_date'),
              Listinfo(data: data, rt: 'atl', lt: 'atl'),
              Listinfo(
                  data: data,
                  rt: 'all-time low change percentage',
                  lt: 'atl_change_percentage'),
              Listinfo(data: data, rt: 'all time low date', lt: 'atl_date'),
              Listinfo(
                  data: data,
                  rt: 'fully diluted valuation',
                  lt: 'fully_diluted_valuation'),
              Listinfo(data: data, rt: 'last updated', lt: 'last_updated'),
            ],
          ),
        ));
  }
}

class Listinfo extends StatelessWidget {
  const Listinfo({
    Key? key,
    required this.data,
    required this.rt,
    required this.lt,
  }) : super(key: key);

  final List data;
  final String rt;
  final String lt;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(rt),
      trailing: Text(data[0][data[1]][lt].toString() != 'null'
          ? data[0][data[1]][lt].toString()
          : 'nothing'),
    );
  }
}
