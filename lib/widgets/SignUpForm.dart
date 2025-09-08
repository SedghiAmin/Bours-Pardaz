import 'dart:convert';
//import 'dart:math';

import 'package:bourse_pardaz/MainPage.dart';
import 'package:bourse_pardaz/widgets/LoginForm.dart';
import 'package:bourse_pardaz/widgets/OtpForm.dart';
import 'package:bourse_pardaz/widgets/ResetOTP.dart';
import 'package:bourse_pardaz/widgets/Register.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

class SignUpForm extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb; */

  SignUpForm({
    Key? key,
    required this.title,
    required this.drawerTitle,
    /* required this.localStorageMobile,
    required this.localStorageWeb, */
  }) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  FocusNode focusNode = FocusNode();

  String nameHintText = 'نام';

  String errMessageForm = '';

  final TextEditingController _controllerFirst = TextEditingController();

  final TextEditingController _controllerLast = TextEditingController();

  final TextEditingController _controllerMobile = TextEditingController();

  final TextEditingController _controllerEmail = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  final TextEditingController _controllerCPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(
      () {
        if (focusNode.hasFocus) nameHintText = '';
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "ثبت نام کاربر جدید",
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
                  child: AutofillGroup(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 16.5,
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            focusNode: focusNode,
                            //autofocus: true,
                            controller: _controllerFirst,
                            keyboardType: TextInputType.name,
                            autofillHints: [AutofillHints.givenName],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.person,
                                color: Color(0xff318d90),
                              ),
                              hintText: nameHintText,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 16.5,
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            controller: _controllerLast,
                            keyboardType: TextInputType.name,
                            autofillHints: [AutofillHints.familyName],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.person,
                                color: Color(0xff318d90),
                              ),
                              hintText: 'نام خانوادگی',
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 16.5,
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            controller: _controllerEmail,
                            keyboardType: TextInputType.emailAddress,
                            autofillHints: [AutofillHints.email],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.email,
                                color: Color(0xff318d90),
                              ),
                              hintText: 'ایمیل',
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 16.5,
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            controller: _controllerMobile,
                            keyboardType: TextInputType.phone,
                            autofillHints: [
                              AutofillHints.telephoneNumberDevice
                            ],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.mobile_friendly,
                                color: Color(0xff318d90),
                              ),
                              hintText: 'شماره موبایل',
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 16.5,
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
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
                          height: 15,
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
                                    'ثبت نام',
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

                            /*
                            //-------------Field: Name
                            if (_controllerFirst.text == '')
                              errMessageForm +=
                                  "* تکمیل فیلد 'نام' الزامی است." + "\n";
                            else if (_controllerFirst.text != '' &&
                                !RegExp(r'^[a-z A-Z]+$')
                                    .hasMatch(_controllerFirst.text) &&
                                !RegExp(r'^[\u0621-\u0628\u062A-\u063A\u0641-\u0642\u0644-\u0648\u064E-\u0651\u0655\u067E\u0686\u0698\u06A9\u06AF\u06BE\u06CC]+$')
                                    .hasMatch(_controllerFirst.text))
                              errMessageForm +=
                                  "* در فیلد 'نام' از کاراکترهای نامعتبر استفاده شده است." +
                                      "\n";
                            //-------------Field: Last
                            if (_controllerLast.text == '')
                              errMessageForm +=
                                  "* تکمیل فیلد 'نام خانوادگی' الزامی است." +
                                      "\n";
                            else if (_controllerLast.text != '' &&
                                !RegExp(r'^[a-z A-Z]+$')
                                    .hasMatch(_controllerLast.text) &&
                                !RegExp(r'^[\u0621-\u0628\u062A-\u063A\u0641-\u0642\u0644-\u0648\u064E-\u0651\u0655\u067E\u0686\u0698\u06A9\u06AF\u06BE\u06CC]+$')
                                    .hasMatch(_controllerLast.text))
                              errMessageForm +=
                                  "* در فیلد 'نام خانوادگی' از کاراکترهای نامعتبر استفاده شده است." +
                                      "\n";*/
                            //-------------Field: Email
                            if (_controllerEmail.text == '')
                              errMessageForm +=
                                  "* تکمیل فیلد 'ایمیل' الزامی است." + "\n";
                            else if (_controllerEmail.text != '' &&
                                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(_controllerEmail.text.trim()))
                              errMessageForm +=
                                  "* فرمت ایمیل وارد شده معتبر نمیباشد." + "\n";

                            //-------------Field: Mobile
                            if (_controllerMobile.text == '')
                              errMessageForm +=
                                  "* تکمیل فیلد 'موبایل' الزامی است." + "\n";
                            else if (_controllerMobile.text != '' &&
                                //!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                !RegExp(r'^09[0-9]{9}$')
                                    .hasMatch(_controllerMobile.text.trim()))
                              errMessageForm +=
                                  "* موبایل وارد شده صحیح نمیباشد." + "\n";

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
                              errMessageForm +=
                                  "* پسورد ها با هم یکسان نیستند.";

                            if (errMessageForm == '') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(
                                    title: widget.title,
                                    drawerTitle: widget.drawerTitle,
                                    /*localStorageMobile:
                                         widget.localStorageMobile,
                                        localStorageWeb: widget.localStorageWeb, */
                                    first: _controllerFirst.text.trim(),
                                    last: _controllerLast.text.trim(),
                                    mobile: _controllerMobile.text.trim(),
                                    email: _controllerEmail.text.trim(),
                                    password: _controllerPassword.text,
                                    client: http.Client(),
                                  ),
                                ),
                              );
                              /*registerUser(
                                  _controllerFirst.text,
                                  _controllerLast.text,
                                  _controllerMobile.text,
                                  _controllerEmail.text,
                                  _controllerPassword.text,
                                  http.Client(),
                                  context);*/
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
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text("حساب کاربری دارید؟"),
                                Text(
                                  "لاگین کنید",
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
                                  builder: (context) => LoginForm(
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
                        SizedBox(
                          height: 10,
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
                                          /* localStorageMobile:
                                            widget.localStorageMobile,
                                            localStorageWeb: widget.localStorageWeb,
                                        jwt: '', */
                                          name: ''),
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
                                        /* localStorageMobile:
                                            widget.localStorageMobile,
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
                                        /* localStorageMobile:
                                            widget.localStorageMobile,
                                            localStorageWeb: widget.localStorageWeb, */
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
                child: new Text("OK"),
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
}
