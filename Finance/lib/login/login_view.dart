import 'package:finance/login/signin_view.dart';
import 'package:finance/login/signup_view.dart';
import 'package:finance/shares/my_colors.dart';
import 'package:flutter/material.dart';
import '../icons/my_flutter_app_icons.dart';

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.App,
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/process.jpeg',
                width: 420,
                height: 340,
                alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 50, top: 30, right: 50, bottom: 50),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Manage your expenses',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'seamlessly & intuitively',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 50, left: 50, bottom: 50),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    myButtonIconOutline(
                        'Sign in with Google', MyFlutterApp.google_1, () {
                      print('sign in click');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationSignInScreen()));
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    myButtonOutline('Create an account', () {
                      print('create account click');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationSignUpScreen()));
                    }),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Already have an account? ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Sign in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget myButtonIconOutline(String text, IconData? icon, Function() callback) {
  return SizedBox(
    width: double.infinity,
    height: 45,
    child: OutlinedButton(
      onPressed: () => callback(),
      style: OutlinedButton.styleFrom(
        primary: MyColors.App,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: icon != null ? Icon(icon) : null,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                text = text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    ),
  );
}

Widget myButtonOutline(String text, Function() callback) {
  return SizedBox(
    width: double.infinity,
    height: 45,
    child: OutlinedButton(
      onPressed: () => callback(),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: MyColors.App,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: const BorderSide(width: 2, color: Colors.white),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              text = text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
