
import 'package:flutter/material.dart';
import 'package:flutter_crypto_test/price_tracker/helpers/helpers.dart';

import '../../models/coin_model.dart';
import '../widgets/coin_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Helpers helpers = Helpers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[300],
          centerTitle: true,
          title: Text(
            'Crypto Tracker',
            style: TextStyle(
                color: Colors.grey[900],
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder<List<Coin>>(
          future: helpers.fetchCoin(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (!snapshot.hasData){
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data?.length,
            itemBuilder: (context, index) {
              return CoinCardWidget(
                name: data![index].name,
                symbol: data[index].symbol,
                imageUrl: data[index].imageUrl,
                price: data[index].price.toDouble(),
                change: data[index].change.toDouble(),
                changePercentage: data[index].changePercentage.toDouble(),
              );
            });
          }));
          
        
  }
}
