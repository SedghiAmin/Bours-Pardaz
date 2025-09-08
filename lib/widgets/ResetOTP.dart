import 'dart:convert';

import 'package:bourse_pardaz/MainPage.dart';
import 'package:bourse_pardaz/widgets/OtpForm.dart';
import 'package:bourse_pardaz/widgets/SignUpForm.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

class ResetOTP extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb; */

  ResetOTP(
      {Key? key,
      required this.title,
      required this.drawerTitle,
      /* required this.localStorageMobile,
      required this.localStorageWeb */})
      : super(key: key);

  @override
  _ResetOTPState createState() => _ResetOTPState();
}

class _ResetOTPState extends State<ResetOTP> {
  final TextEditingController _controllerEmail = TextEditingController();

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
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ارسال مجدد کد فعالسازی",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff318d90)),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 100.0, left: 8, right: 8),
                      child: Column(
                        children: [
                          Container(
                            width: 380,
                            child: Row(
                              //textDirection: TextDirection.ltr,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5)
                                      ]),
                                  child: TextFormField(
                                    //autofocus: true,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        counterText: '',
                                        hintText: 'ایمیل'),
                                    style: TextStyle(),
                                    textAlign: TextAlign.center,
                                    controller: _controllerEmail,
                                  ),
                                ),
                                InkWell(
                                  child: Container(
                                    height: 50,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xffeaddd4),
                                          Color(0xffeaddd4),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'ارسال مجدد',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff318d90),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    resendOTP(
                                        _controllerEmail.text.trim(),
                                        //widget.localStorageMobile,
                                        http.Client(),
                                        context);
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Text(
                                "در صورتی که کد فعالسازی را در پوشه Inbox مشاهده نکردید، لطفا پوشه Spam را چک بفرمایید.",
                                style: TextStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Text(
                                "لطفا توجه داشته باشید، ممکن است ارسال کد فعالسازی تا 5 دقیقه تاخیر داشته باشید.",
                                style: TextStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
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
                                          name:'',
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                InkWell(
                                  child: Text(
                                    'ثبت نام',
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                      color: Color(0xff318d90),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpForm(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "تایید کد فعالسازی",
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
        ],
      ),
    );
  }

  resendOTP(String email, /* FlutterSecureStorage localStorageMobile, */
      http.Client client, var context) async {
    final http.Response response = await client.post(
      Uri.parse('http://bourspardaz.ir/api/resetotp.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{'email': email},
      ),
    );

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      // If the server did return a 200 CREATED response,
      // then parse the JSON.

      // ignore: unused_local_variable
      final message = jsonDecode(utf8.decode(response.bodyBytes));
      //print(message);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("تایید کد فعالسازی"),
            content: new Text(
                "کد فعالسازی حساب شما مجددا ارسال شد. لطفا ایمیل خود را چک بفرمایید."),
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
    } else if (response.statusCode == 400 && response.body.isNotEmpty) {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.

      final message = jsonDecode(utf8.decode(response.bodyBytes));
      print(message);

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
      //throw Exception('خطا در ورود به سامانه');
    }
  }
}
