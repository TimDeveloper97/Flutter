import 'package:flutter/cupertino.dart';

class Login
{
  late TextEditingController username;
  late TextEditingController password;
  late TextEditingController name;
  late DateTime time;

  Login()
  {
    username = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
  }
}
