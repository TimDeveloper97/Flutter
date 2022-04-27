import 'package:flutter/cupertino.dart';

class Transaction{
  String title;
  String description;
  String money;
  Icon icon;

  Transaction(this.icon, this.title, this.description, this.money);
}