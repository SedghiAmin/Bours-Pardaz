import 'dart:convert';
//import 'dart:math';

// ignore: unused_import
import 'package:bourse_pardaz/MainPage.dart';
// ignore: unused_import
import 'package:bourse_pardaz/widgets/LoginForm.dart';
import 'package:bourse_pardaz/widgets/OtpForm.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb; */
  final String first;
  final String last;
  final String mobile;
  final String email;
  final String password;
  final http.Client client;

  Register({
    Key? key,
    required this.title,
    required this.drawerTitle,
    /* required this.localStorageMobile,
    required this.localStorageWeb, */
    required this.first,
    required this.last,
    required this.mobile,
    required this.email,
    required this.password,
    required this.client,
  }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  FocusNode focusNode = FocusNode();

  String errMessageForm = '';

  @override
  void initState() {
    super.initState();
    registerUser(widget.first, widget.last, widget.mobile, widget.email,
        widget.password, widget.client, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          //color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textDirection: TextDirection.ltr,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: <Color>[Color(0xff085479), Color(0xff85c9e0)],
                    ),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 32, right: 32),
                        child: Text(
                          'سامانه تحلیل داده‌های بورس پرداز',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 150.0),
                      child: Container(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpForm(
                                  title: widget.title,
                                  drawerTitle: widget.drawerTitle,
                                  /* localStorageMobile: widget.localStorageMobile,
                                  localStorageWeb: widget.localStorageWeb, */
                                ),
                              ),
                            ),
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xffeaddd4))),
                          //color: Color(0xff318d90),
                          child: Text(
                            'تایید کد فعالسازی ثبت نام',
                            style: TextStyle(
                                color: Color(0xff318d90),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        height: 50,
                        width: 250,
                        child: ElevatedButton(
                          onPressed: () => {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(
                                  title: widget.title,
                                  drawerTitle: widget.drawerTitle,
                                  /* localStorageMobile: widget.localStorageMobile,
                                  localStorageWeb: widget.localStorageWeb,
                                  jwt: '', */
                                  name:'',
                                ),
                              ),
                            ),
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xffeaddd4))),
                          //color: Color(0xff318d90),
                          child: Text(
                            'انتقال به صفحه نخست برنامه',
                            style: TextStyle(
                                color: Color(0xff318d90),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  registerUser(String firstName, String lastName, String mobile, String email,
      String password, http.Client client, var context) async {
    final response = await client.post(
      Uri.parse('http://bourspardaz.ir/api/register.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'name': firstName,
          'last': lastName,
          'mobile': mobile,
          'email': email,
          'password': password,
          'cpassword': password,
          'register_date': DateTime.now().toString()
        },
      ),
    );

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      //final message = jsonDecode(utf8.decode(response.bodyBytes));
      //print('okey Register: 200 ' + message['message']);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("ارسال کد فعالسازی !!"),
            content: new Text(
                "لطفا ایمیل خود را چک بفرمایید و کد فعالسازی را وارد نمایید."),
            actions: <Widget>[
              new TextButton(
                child: new Text("قبول"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpForm(
                        title: widget.title,
                        drawerTitle: widget.drawerTitle,
                        /* localStorageMobile: widget.localStorageMobile,
                        localStorageWeb: widget.localStorageWeb, */
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );

      /*for (var i in userJson) {
        var userItem =
            UserLogin(i['message'], i['jwt'], i['email'], i['expireAt']);
        _userLoginedInfo.add(userItem);
      }

      print(_userLoginedInfo);

      return _userLoginedInfo;*/
    } else if (response.statusCode == 400 && response.body.isNotEmpty) {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //print('Failed Register: 400');
      final message = jsonDecode(utf8.decode(response.bodyBytes));

      //print(message);
      if (message['email_existed_code'] == 1)
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("خطا در ثبت نام !!"),
              content: Text(
                message['email_existed_message'],
              ),
              actions: <Widget>[
                new TextButton(
                  child: new Text("قبول"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      //throw Exception('خطا در ورود به سامانه');
    }
  }
}
