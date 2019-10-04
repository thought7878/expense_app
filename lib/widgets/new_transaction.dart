import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final priceController = TextEditingController();

  void submitTx() {
    final title = titleController.text;
    final price = double.parse(priceController.text);
    if (title.isEmpty || price <= 0) {
      return;
    }
    widget.addTx(title, price);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'price'),
              controller: priceController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitTx(),
            ),
            FlatButton(
              child: Text('Submit'),
              textColor: Colors.purple,
              // color: Colors.purple,
              onPressed: submitTx,
            ),
          ],
        ),
      ),
    );
  }
}
