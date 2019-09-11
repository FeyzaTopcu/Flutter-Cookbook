import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

import '../model/item_model.dart';

import '../resources/api_provider.dart';
import '../resources/repository.dart';
import '../utility/Static.dart';
import '../utility/themes.dart';
import 'anasayfa.dart';


class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
    Login({this.username});


    final String username;

}

class LoginState extends State<Login> with TickerProviderStateMixin {
  TextEditingController userNameController, passwordController;
  bool remember = true;

  String _status = 'no-action';
  final formKey = GlobalKey<FormState>();

  @override
  initState() {
    userNameController = TextEditingController(text: widget?.username ?? "");
    passwordController = TextEditingController();
    _loadUsername();
    super.initState();
    print(_status);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  void Remember() {
    setState(() {
      remember = !remember;
    });
  }

  @override
  Widget build(BuildContext context) {
    String _username, _password;
    return Scaffold(
        backgroundColor: myzColors.shark[50],
        body: new Form(
          child: new Container(
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "",
                        style: TextStyle(
                          backgroundColor: myzColors.shark[50],
                        ),
                      ),
                      padding: EdgeInsets.all(15.0),
                    ),
                    Image.asset(
                      "assets/baslik.jpg",
                      height: 170,
                      width: 170,
                    ),
                    Container(
                      child: Text(
                        "",
                        style: TextStyle(
                          backgroundColor: myzColors.shark[50],
                        ),
                      ),
                      padding: EdgeInsets.all(5.0),
                    ),
                    Padding(
                      padding: EdgeInsets.all(9.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: userNameController,
                            cursorColor: myzColors.teak[90],
                            keyboardType: TextInputType.text,
                            autofocus: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Image.asset(
                                "assets/user.jpg",
                                scale: 7,
                              ),
                              hintText: "USERNAME",
                              hintStyle: TextStyle(
                                color: myzColors.white[80],
                                fontFamily: "Proxi",
                              ),
                            ),
                           style: TextStyle(
                              color: myzColors.white[80],
                            ),
                          ),
                          Divider(
                            color: myzColors.teak[90],
                            height: 4.0,
                          ),
                          Container(
                            child: TextFormField(
                              obscureText: true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Image.asset(
                                    "assets/pasw.jpg",
                                    scale: 7,
                                  ),
                                  hintText: "PASSWORD",
                                  hintStyle: TextStyle(
                                    color: myzColors.white[80],
                                    fontFamily: "Proxi",
                                  )),

                              //   focusNode: myFocusNode,
                              style: TextStyle(
                                color: myzColors.white[80],
                              ),
                              keyboardType: TextInputType.text,
                              autofocus: true,
                              cursorColor: myzColors.teak[90],
                            ),
                          ),
                          Divider(
                            color: myzColors.teak[90],
                            height: 4.0,
                          ),
                          Container(
                            child: Text(
                              "",
                              style: TextStyle(
                                backgroundColor: myzColors.shark[50],
                              ),
                            ),
                            padding: EdgeInsets.all(9.0),
                          ),
                          Container(
                            width: 500.0,
                            padding:
                            new EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 17.0),
                            color: myzColors.teak[90],
                            child: new Column(children: [
                              new GestureDetector(

                                  ItemRequestModel request =
                                  new ItemRequestModel(
                                      grant_type: "password",
                                      username: userNameController.text,
                                      password: passwordController.text);
                                  ItemResponseModel response =
                                  await Repository().getToken(Api.TOKEN_API,
                                      body: request.toMap());
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Anasayfa(),
                                    ),
                                  );
                                },
                                child: new Center(
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        fontFamily:
                                        "src/fonts/proximanovabold.ttf",
                                        color: myzColors.white[80],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
                            ]),
                          ),
                          GestureDetector(
                            onTap: () {
                              Remember();
                            },
                            child: new Row(
                              children: [
                                Container(
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                      backgroundColor: myzColors.shark[50],
                                    ),
                                  ),
                                  padding: EdgeInsets.only(
                                      left: 50, top: 45, right: 55),
                                ),
                                Container(
                                  child: Image.asset(
                                    remember
                                        ? 'assets/secili.jpg'
                                        : 'assets/bos.jpg',
                                    alignment: Alignment.center,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                      backgroundColor: myzColors.shark[50],
                                    ),
                                  ),
                                  padding: EdgeInsets.all(5.0),
                                ),
                                Text(
                                  "Remember me",
                                  style: TextStyle(
                                      color: myzColors.teak[90],
                                      fontSize: 15,
                                      fontFamily:
                                      "src/fonts/proximanovareg.ttf"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void _loadUsername() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _username = _prefs.getString("saved_username") ?? "";
      var remember = _prefs.getBool("remember_me") ?? false;

      if (remember) {
        userNameController.text = _username ?? "";
      }
    } catch (e) {
      print(e);
    }
  }
  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return true;
    else
      return false;
  }
}