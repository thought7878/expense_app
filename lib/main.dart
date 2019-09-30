import 'package:expense_app/Transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Transaction> txs = [
      Transaction(
          id: 'tx1', title: 'shoes', price: 49.99, date: DateTime.now()),
      Transaction(
          id: 'tx2', title: 'chickens', price: 19.99, date: DateTime.now()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Card(
              color: Colors.blue,
              child: Text('Card A'),
            ),
            width: double.infinity,
          ),
          Column(
            children: txs.map((tx) {
              return Card(
                color: Colors.red,
                child: Text(tx.title),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
