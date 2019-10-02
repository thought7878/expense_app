import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  NewTransaction(this.addTx);

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
            ),
            FlatButton(
              child: Text('Submit'),
              textColor: Colors.purple,
              // color: Colors.purple,
              onPressed: () {
                addTx(titleController.text, double.parse(priceController.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}
