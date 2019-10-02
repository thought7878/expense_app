import 'package:expense_app/models/Transaction.dart';
import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  List<Transaction> txs = [
    Transaction(id: 'tx1', title: 'shoes', price: 49.99, date: DateTime.now()),
    Transaction(
        id: 'tx2', title: 'chickens', price: 19.99, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double price) {
    final tx = Transaction(
      title: title,
      price: price,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      txs.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(
          transactions: txs,
        ),
      ],
    );
  }
}
