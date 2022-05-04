import 'package:finance/controls/account/level_skill.dart';
import 'package:finance/icons/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import '../shares/my_colors.dart';

class Menu {
  Icon icon;
  String title;

  Menu(this.icon, this.title);
}

final List<Menu> _menus = [
  Menu(
      Icon(
        MyFlutterApp.user,
        color: Colors.green,
      ),
      'Profile'),
  Menu(
      Icon(
        Icons.notifications,
        color: Colors.blue,
      ),
      'Notification'),
  Menu(
      Icon(
        MyFlutterApp.account_balance_wallet,
        color: Colors.deepPurple,
      ),
      'Wallet'),
  Menu(
      Icon(
        Icons.info_outline,
        color: Colors.amber,
      ),
      'About'),
  Menu(
      Icon(
        Icons.settings,
        color: Colors.black,
      ),
      'Config'),
  Menu(
      Icon(
        Icons.logout,
        color: Colors.red,
      ),
      'logout'),
];

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPage createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //Header Container
          header(),

          //Body Container
          Expanded(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.only(top: 20),
              child: body(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget header() {
  return Padding(
    padding: const EdgeInsets.only(top: 30, bottom: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Tim Developer',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: MyColors.primary,
          ),
        ),
        Text(
          'Mobile Team',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: MyColors.gray.withOpacity(0.8),
          ),
        ),
      ],
    ),
  );
}

Widget body() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 300,
        width: 300,
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/cat.jpg'),
                radius: 150,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 60,
                height: 60,
                margin: const EdgeInsets.only(bottom: 5, right: 10),
                padding: const EdgeInsets.only(bottom: 3),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  color: MyColors.blue.withOpacity(0.3),
                  border: Border.all(color: Colors.grey.withOpacity(0.05), width: 2),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.camera,
                    color: MyColors.blue,
                    size: 40,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 20),
        child: LevelSkill(level: 2.5, max: 10),
      ),
      for (var item in _menus) itemMenu(item),
    ],
  );
}

Widget itemMenu(Menu menu) {
  return Container(
      padding: const EdgeInsets.only(left: 35, right: 30, bottom: 5, top: 5),
      decoration: BoxDecoration(border: Border.all(color: MyColors.gray.withOpacity(0.15))),
      height: 60,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: MyColors.gray.withOpacity(0.1)),
                  color: menu.icon.color?.withOpacity(0.15),
                ),
                child: menu.icon,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  menu.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    color: MyColors.gray,
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.arrow_right,
              color: MyColors.gray.withOpacity(0.3),
              size: 30,
            ),
          )
        ],
      ));
}
