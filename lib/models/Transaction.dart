import 'package:flutter/material.dart';

class Transaction {
  final String id;
  String title;
  double price;
  final DateTime date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.date,
  });
}
