import 'package:expense_app/widgets/chart.dart';
import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'models/Transaction.dart';

void main() =>
    initializeDateFormatting("zh_CN", null).then((_) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.green,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(color: Colors.white),
            ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Transaction> txs = [
    // Transaction(id: 'tx1', title: 'shoes', price: 49.99, date: DateTime.now()),
    // Transaction(
    //     id: 'tx2', title: 'chickens', price: 19.99, date: DateTime.now()),
  ];

  void _showNewTxSheet(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  void _addNewTransaction(String title, double price, DateTime chosenDate) {
    final tx = Transaction(
      title: title,
      price: price,
      date: chosenDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      txs.add(tx);
    });
  }

  List<Transaction> get _recentTransactions {
    return txs.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense App',
          // style: TextStyle(fontFamily: 'OpenSans'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showNewTxSheet(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Chart(_recentTransactions),
              width: double.infinity,
            ),
            TransactionList(
              transactions: txs,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showNewTxSheet(context),
      ),
    );
  }
}
