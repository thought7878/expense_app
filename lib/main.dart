import 'package:expense_app/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'widgets/transaction_list.dart';

void main() =>
    initializeDateFormatting("zh_CN", null).then((_) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.blue,
                child: Text('Chart'),
                elevation: 5,
              ),
              width: double.infinity,
            ),
            UserTransaction(),
          ],
        ),
      ),
    );
  }
}
