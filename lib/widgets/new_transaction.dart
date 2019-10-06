import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  DateTime _chosenDateTime;

  void _submitTx() {
    final title = titleController.text;
    final price = double.parse(priceController.text);
    if (title.isEmpty || price <= 0 || _chosenDateTime == null) {
      return;
    }
    widget.addTx(title, price, _chosenDateTime);
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((dateTime) {
      setState(() {
        _chosenDateTime = dateTime;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
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
                onSubmitted: (_) => _submitTx(),
              ),
              Container(
                height: 70,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      // fit: FlexFit.tight,
                      child: Text(_chosenDateTime == null
                          ? 'No Date Chosen!'
                          : 'Picked Date:${DateFormat.yMd('zh_CN').format(_chosenDateTime)}'),
                    ),
                    FlatButton(
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _showDatePicker,
                      textColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
              RaisedButton(
                child: Text('Submit'),
                textColor: Theme.of(context).textTheme.button.color,
                color: Theme.of(context).primaryColor,
                onPressed: _submitTx,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
