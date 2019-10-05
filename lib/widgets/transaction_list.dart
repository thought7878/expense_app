import 'package:expense_app/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({@required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transation!'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (cxt, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  elevation: 0,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text(
                                '\$${transactions[index].price.toStringAsFixed(0)}')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(DateFormat.yMd('zh_CN')
                        .format(transactions[index].date)),
                  ),
                );
              },
            ),
    );
  }

  Widget customListItem(BuildContext context, int index) {
    return Card(
      // color: Colors.red,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(4),
            child: Text(
              '\$${transactions[index].price.toStringAsFixed(2)}',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                transactions[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                DateFormat('yyyy-MM-dd HH:mm:ss')
                    .format(transactions[index].date),
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
  }
}
