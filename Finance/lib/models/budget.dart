import 'package:flutter/cupertino.dart';

class Budget{
  String title;
  String description;
  String avg;
  double availableMoney;
  double targetMoney;
  Icon iconTitle;
  Icon iconSub;

  Budget(this.title, this.description, this.avg, this.availableMoney, this.targetMoney, this.iconTitle, this.iconSub);
}