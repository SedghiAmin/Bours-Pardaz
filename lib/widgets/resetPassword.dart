import 'dart:convert';
//import 'dart:math';

import 'package:bourse_pardaz/MainPage.dart';
import 'package:bourse_pardaz/widgets/LoginForm.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

class ResetPassword extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb; */
  final String email;

  ResetPassword({
    Key? key,
    required this.title,
    required this.drawerTitle,
    /* required this.localStorageMobile,
    required this.localStorageWeb, */
    required this.email,
  }) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  FocusNode focusNode = FocusNode();

  String errMessageForm = '';

  final TextEditingController _controllerCode = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  final TextEditingController _controllerCPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    sendOTP(widget.email, /* widget.localStorageMobile, */ http.Client(), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
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
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "تنظیم مجدد رمز عبور",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff318d90)),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.4,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 16.5,
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextFormField(
                          controller: _controllerCode,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.email,
                              color: Color(0xff318d90),
                            ),
                            hintText: 'کد تایید هویت',
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 16.5,
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextFormField(
                          controller: _controllerPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.vpn_key,
                              color: Color(0xff318d90),
                            ),
                            hintText: 'رمز عبور: حداقل 8 کاراکتر',
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 16.5,
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextFormField(
                          controller: _controllerCPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.vpn_key,
                              color: Color(0xff318d90),
                            ),
                            hintText: 'رمز عبور را مجددا وارد نمایید',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 14,
                          margin: EdgeInsets.only(top: 10),
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
                                    Icons.app_registration,
                                    color: Color(0xff318d90),
                                  ),
                                ),
                                Text(
                                  'تغییر رمز عبور',
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
                          errMessageForm = '';

                          //-------------Field: Password
                          if (_controllerPassword.text == '')
                            errMessageForm +=
                                "* تکمیل فیلد 'رمز عبور' الزامی است." + "\n";
                          else if (_controllerPassword.text != '' &&
                              !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                                  .hasMatch(_controllerPassword.text))
                            errMessageForm +=
                                "* پسورد میبایست حداقل 8 کاراکتر و شامل حروف کوچک و بزرگ انگلیسی، اعداد و کاراکترهای خاص مثل @\$\!\%\*\?\&\ باشد." +
                                    "\n";

                          //-------------Field: CPassword
                          if (_controllerCPassword.text !=
                              _controllerPassword.text)
                            errMessageForm += "* پسورد ها با هم یکسان نیستند.";

                          if (errMessageForm == '') {
                            rsetPasswordUser(
                                _controllerCode.text,
                                _controllerPassword.text,
                                _controllerCPassword.text,
                                http.Client(),
                                context);
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: new Text("خطا در ثبت نام !!"),
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
                      SizedBox(
                        height: 100,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Text(
                                "صفحه اصلی",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
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
                                      /* localStorageMobile:
                                          widget.localStorageMobile,
                                          localStorageWeb: widget.localStorageWeb,
                                      jwt: '', */
                                      name:'',
                                    ),
                                  ),
                                );
                              },
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("اگر در بورس پرداز حساب کاربری دارید "),
                                InkWell(
                                  child: Text(
                                    "لاگین کنید",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff318d90),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginForm(
                                          title: widget.title,
                                          drawerTitle: widget.drawerTitle,
                                          /* localStorageMobile:
                                              widget.localStorageMobile,
                                              localStorageWeb: widget.localStorageWeb, */
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  rsetPasswordUser(String code, String password, String cpassword,
      http.Client client, var context) async {
    final response = await client.post(
      Uri.parse('http://bourspardaz.ir/api/resetPassword.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'code': code,
          'password': password,
          'cpassword': cpassword,
        },
      ),
    );

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      //print('okey reset password: 200');

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("تغییر رمز عبور !!"),
            content: new Text("عملیات تغییر پسورد با موفقیت انجام شد."),
            actions: <Widget>[
              new TextButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginForm(
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
      if (message['email_existed_code'] == 0)
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("خطا !!"),
              content: Text(
                message['email_existed_message'],
              ),
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
  }

  Future sendOTP(String email, /* FlutterSecureStorage localStorageMobile, */
      http.Client client, var context) async {
    final http.Response response = await client.post(
      Uri.parse('http://bourspardaz.ir/api/forgotPassword.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{"email": email},
      ),
    );

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      // ignore: unused_local_variable
      //print('ok');
      // ignore: unused_local_variable
      final message = jsonDecode(utf8.decode(response.bodyBytes));
      //print(message);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("ارسال کد تایید هویت"),
            content: new Text(
                "کد تایید هویت برای شما ارسال شد. لطفا ایمیل خود را چک بفرمایید."),
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
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //print('not ok');
      // ignore: unused_local_variable
      final message = jsonDecode(utf8.decode(response.bodyBytes));
      //print(message);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("خطا !!"),
            content: new Text("ایمیل وارد شده یافت نشد."),
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
      return 1;
    }
  }
}
