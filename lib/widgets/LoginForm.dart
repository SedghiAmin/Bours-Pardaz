// ignore_for_file: unused_local_variable

/* import 'dart:convert';

import 'package:bourse_pardaz/MainPage.dart';
import 'package:bourse_pardaz/widgets/OtpForm.dart';
import 'package:bourse_pardaz/widgets/ResetOTP.dart';
import 'package:bourse_pardaz/widgets/SignUpForm.dart';
import 'package:bourse_pardaz/widgets/forgotPassword.dart';
import 'package:flutter/foundation.dart'; */
import 'package:flutter/material.dart';
/* import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; */
//import 'package:flutter/services.dart';

/* import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; */

class LoginForm extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb; */

  LoginForm({
    Key? key,
    required this.title,
    required this.drawerTitle,
    /* required this.localStorageMobile,
    required this.localStorageWeb, */
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String errMessageForm = '';
  /* final TextEditingController _controllerEmail = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController(); */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
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
            /* Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 62),
                    child: AutofillGroup(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 50,
                            padding: EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextField(
                              controller: _controllerEmail,
                              keyboardType: TextInputType.emailAddress,
                              autofillHints: [AutofillHints.email],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.person,
                                  color: Color(0xff318d90),
                                ),
                                hintText: 'نام کاربری یا ایمیل',
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 50,
                            margin: EdgeInsets.only(top: 32),
                            padding: EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextField(
                              controller: _controllerPassword,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              autofillHints: [AutofillHints.password],
                              onEditingComplete: () =>
                                  TextInput.finishAutofillContext(),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.vpn_key,
                                  color: Color(0xff318d90),
                                ),
                                hintText: 'رمز عبور',
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16, left: 0),
                              child: InkWell(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'فراموشی رمز عبور',
                                    style: TextStyle(color: Color(0xff318d90)),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ForgotPassword(
                                        title: widget.title,
                                        drawerTitle: widget.drawerTitle,
                                        /* localStorageMobile:
                                            widget.localStorageMobile,
                                        localStorageWeb: widget.localStorageWeb, */
                                      ),
                                    ),
                                  );
                                  //SignUpForm();
                                },
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 1.2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffeaddd4),
                                    Color(0xffeaddd4),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Icon(
                                        Icons.login,
                                        color: Color(0xff318d90),
                                      ),
                                    ),
                                    Text(
                                      'ورود',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff318d90),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              if (_controllerEmail.text == '')
                                errMessageForm =
                                    "* تکمیل فیلد 'ایمیل' الزامی است" + "\n";
                              if (_controllerPassword.text == '')
                                errMessageForm +=
                                    "* تکمیل فیلد 'رمز عبور' الزامی است" + "\n";
                              if (errMessageForm == '') {
                                loginedUser(
                                    _controllerEmail.text.trim(),
                                    _controllerPassword.text,
                                    /* widget.localStorageMobile,
                                    widget.localStorageWeb, */
                                    http.Client(),
                                    context);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: new Text("خطا در ورود !!"),
                                      content: Text(
                                        errMessageForm,
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      actions: <Widget>[
                                        new TextButton(
                                          child: new Text(
                                            "OK",
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("حساب کاربری ندارید؟"),
                          Text(
                            "ثبت نام کنید",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff318d90),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpForm(
                              title: widget.title,
                              drawerTitle: widget.drawerTitle,
                              /* localStorageMobile: widget.localStorageMobile,
                              localStorageWeb: widget.localStorageWeb, */
                            ),
                          ),
                        );
                        //SignUpForm();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    //padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          child: Text(
                            'صفحه اصلی',
                            style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              color: Color(0xff318d90),
                            ),
                          ),
                          onTap: () {
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
                            );
                          },
                        ),
                        InkWell(
                          child: Text(
                            'تایید کد فعالسازی',
                            style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              color: Color(0xff318d90),
                            ),
                          ),
                          onTap: () {
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
                        InkWell(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ارسال مجدد کد فعالسازی",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  color: Color(0xff318d90),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResetOTP(
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
                    ),
                  ),
                ],
              ),
            ), */
          ],
        ),
      ),
    );
  }

  /* loginedUser(
      String userName,
      String password,
      /* FlutterSecureStorage localStorageMobile,
      Future<SharedPreferences> _localStorageWeb, */
      http.Client client,
      var context) async {
    SharedPreferences localStorageWeb = await _localStorageWeb;

    final response = await client.post(
      Uri.parse('http://bourspardaz.ir/api/login.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{'email': userName, 'password': password},
      ),
    );
    late String jwt;
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      final userJson = jsonDecode(utf8.decode(response.bodyBytes));
      //print(userJson);

      if (!kIsWeb) {
        await localStorageMobile.deleteAll();

        await localStorageMobile.write(key: 'jwt', value: (userJson['jwt']));
        await localStorageMobile.write(
            key: 'first', value: (userJson['first']));
        await localStorageMobile.write(key: 'last', value: (userJson['last']));
        await localStorageMobile.write(
            key: 'email', value: (userJson['email']));
        await localStorageMobile.write(
            key: 'mobile', value: (userJson['mobile']));
        await localStorageMobile.write(
            key: 'register', value: (userJson['register']));
        await localStorageMobile.write(
            key: 'subscription', value: (userJson['subscription']));
        await localStorageMobile.write(
            key: 'status', value: (userJson['status']));

        //print('From Login Page:' + userJson['jwt']);

        jwt = (await localStorageMobile.read(key: 'jwt'))!;
      } else {
        localStorageWeb.setString('jwt', userJson['jwt'].toString());
        localStorageWeb.setString('first', userJson['first'].toString());
        localStorageWeb.setString('last', userJson['last'].toString());
        localStorageWeb.setString('email', userJson['email'].toString());
        localStorageWeb.setString('mobile', userJson['mobile'].toString());
        localStorageWeb.setString('register', userJson['register'].toString());
        localStorageWeb.setString(
            'subscription', userJson['subscription'].toString());
        localStorageWeb.setString('status', userJson['status'].toString());

        jwt = localStorageWeb.getString('jwt')!;
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("ورود به سامانه !!"),
            content: new Text(userJson['first'].toString() +
                " " +
                userJson['last'].toString() +
                "، " +
                "خوش آمدید."),
            actions: <Widget>[
              new TextButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(
                        drawerTitle: widget.drawerTitle,
                        title: widget.title,
                        /* localStorageMobile: localStorageMobile,
                        localStorageWeb: _localStorageWeb,
                        jwt: userJson['jwt'].toString(), */
                        name: userJson['first'].toString()
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    } else {
      final userJson = jsonDecode(utf8.decode(response.bodyBytes));
      //print(userJson);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("خطا در ورود به سامانه !!"),
            content: new Text("نام کاربری و یا رمز عبور اشتباه است."),
            actions: <Widget>[
              new TextButton(
                child: new Text("OK"),
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
  } */
}
