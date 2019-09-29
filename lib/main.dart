import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('home'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.blue,
                child: Text('Card A'),
              ),
              width: double.infinity,
            ),
            Card(
              color: Colors.red,
              child: Text('Card B'),
            ),
          ],
        ),
      ),
    );
  }
}
