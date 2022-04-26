import 'package:finance/login/signin_view.dart';
import 'package:finance/shares/my_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/login.dart';

class NavigationSignUpScreen extends StatefulWidget {
  NavigationSignUpScreen({Key? key}) : super(key: key);

  late Login _login;
  late bool _isAcceptTermConditions;

  @override
  _NavigationSignUpScreenState createState() => _NavigationSignUpScreenState();
}

class _NavigationSignUpScreenState extends State<NavigationSignUpScreen> {
  @override
  void initState() {
    widget._login = Login();
    widget._isAcceptTermConditions = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.topLeft,
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
                    onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                    child: const Icon(Icons.arrow_back, color: MyColors.blue, size: 38),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      primary: Colors.transparent,
                      padding: const EdgeInsets.all(15),
                      onPrimary: Colors.transparent.withOpacity(0.5),
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 60),
                  child: const Text(
                    'Create account',
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
                shadowColor: Colors.black.withOpacity(0.5),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
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
                          'Welcome',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                            color: MyColors.primary,
                          ),
                        ),
                        subtitle: Text(
                          'Hello there, sign up to continue!',
                          style: TextStyle(
                            fontSize: 22,
                            color: MyColors.gray,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFieldTitle('Name', 'Enter your name', widget._login.name, false),
                      TextFieldTitle('Email address', 'Enter your email address', widget._login.username, false),
                      TextFieldTitle('Password', 'Enter password', widget._login.password, true),
                      Container(
                          padding: const EdgeInsets.only(left: 15, bottom: 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        splashRadius: 5,
                                        value: widget._isAcceptTermConditions,
                                        onChanged: (state) {
                                          setState(() {
                                            widget._isAcceptTermConditions = state!;
                                          });
                                        },
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'By creating an account, you agree to our',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              onClickTermConditions(context);
                                            },
                                            child: const Text(
                                              'Term and Conditions',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: MyColors.primary,
                                                decoration: TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: widget._isAcceptTermConditions ? () => onClickSignUp(widget._login) : null,
                                      style: ElevatedButton.styleFrom(
                                        primary: MyColors.blue,
                                        onPrimary: MyColors.gray.withOpacity(0.1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      child: const Text(
                                        'Sign up',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text(
                              'Already have an account? ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  onClickLinkSignIn(context);
                                },
                                child: const Text(
                                  'Sign in',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                )),
                          ],
                        ),
                      )
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

class TextFieldTitle extends StatefulWidget {
  final String _title;
  final String _textLabel;
  final TextEditingController _value;
  final bool _isPassword;
  late bool _passwordVisible;

  TextFieldTitle(this._title, this._textLabel, this._value, this._isPassword, {Key? key}) : super(key: key);

  @override
  _MyTextFieldTitle createState() => _MyTextFieldTitle();
}

class _MyTextFieldTitle extends State<TextFieldTitle> {
  @override
  void initState() {
    widget._passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget._title,
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
            controller: widget._value,
            initialValue: null,
            maxLength: 30,
            obscureText: !widget._passwordVisible && widget._isPassword,
            decoration: InputDecoration(
              labelText: widget._textLabel,
              border: const OutlineInputBorder(),
              suffixIcon: !widget._isPassword
                  ? const Icon(Icons.check_circle)
                  : IconButton(
                      icon: Icon(
                        widget._passwordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      splashRadius: 15,
                      onPressed: () {
                        setState(() {
                          widget._passwordVisible = !widget._passwordVisible;
                        });
                      },
                    ),
              isDense: true,
            ),
            autocorrect: true,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}

void onClickSignUp(Login login) {
  if (kDebugMode) {
    print('name: ${login.name.text}');
    print('username: ${login.username.text}');
    print('password: ${login.password.text}');
  }
}

void onClickTermConditions(BuildContext context) {
  if (kDebugMode) {
    print('onClickTermConditions');
  }
}

void onClickLinkSignIn(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationSignInScreen()));
}
