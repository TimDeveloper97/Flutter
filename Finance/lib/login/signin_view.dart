import 'package:finance/shares/my_colors.dart';
import 'package:flutter/material.dart';
import '../icons/my_flutter_app_icons.dart';

class NavigationSignInScreen extends StatefulWidget {
  const NavigationSignInScreen({Key? key}) : super(key: key);

  @override
  _NavigationSignInScreenState createState() => _NavigationSignInScreenState();
}

class _NavigationSignInScreenState extends State<NavigationSignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/login_background.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(40, 40, 40, 20),
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back,
                        color: MyColors.blue, size: 35),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      primary: Colors.transparent,
                      padding: const EdgeInsets.all(20),
                      onPrimary: Colors.white.withOpacity(0),
                      elevation: 0.0,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: MyColors.blue,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shadowColor: MyColors.gray.withOpacity(0.5),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                elevation: 5,
                margin: const EdgeInsets.only(top: 220),
                child: Container(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ListTile(
                        title: Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                            color: MyColors.primary,
                          ),
                        ),
                        subtitle: Text(
                          'Hello there, sign in to continue!',
                          style: TextStyle(
                            fontSize: 22,
                            color: MyColors.gray,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      myTextFieldTitle(
                          'Username or email', 'Enter your username or email'),
                      myTextFieldTitle('Password', 'Enter your password'),
                      Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: MyColors.blue,
                                ),
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    print('click Sign in');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: MyColors.blue,
                                    onPrimary: MyColors.blue.withOpacity(0.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: Text(
                                    'Sign in',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}

Widget myTextFieldTitle(String title, String labelField) {
  return Container(
    alignment: Alignment.topLeft,
    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: MyColors.gray.withOpacity(0.5),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          initialValue: null,
          maxLength: 30,
          decoration: InputDecoration(
            labelText: labelField,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    ),
  );
}
