import 'package:expense_app/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({@required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
          // color: Colors.red,
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2),
                ),
                padding: EdgeInsets.all(4),
                child: Text(
                  '\$${tx.price}',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tx.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd HH:mm:ss').format(tx.date),
                    // DateFormat.yMMMMd('zh_CN').format(tx.date),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
