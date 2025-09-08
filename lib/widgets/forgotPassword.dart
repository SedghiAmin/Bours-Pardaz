// ignore: unused_import
import 'dart:convert';

import 'package:bourse_pardaz/MainPage.dart';
import 'package:bourse_pardaz/widgets/LoginForm.dart';
import 'package:bourse_pardaz/widgets/OtpForm.dart';
import 'package:bourse_pardaz/widgets/resetPassword.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

class ForgotPassword extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb; */

  ForgotPassword(
      {Key? key,
      required this.title,
      required this.drawerTitle,
      /* required this.localStorageMobile,
      required this.localStorageWeb */})
      : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "فراموشی رمز عبور",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff318d90)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 8, right: 8),
                    child: Column(
                      children: [
                        Container(
                          width: 380,
                          child: Column(
                            //textDirection: TextDirection.ltr,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 280,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12, blurRadius: 5)
                                    ]),
                                child: TextFormField(
                                  //autofocus: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.email,
                                        color: Color(0xff318d90),
                                      ),
                                    ),
                                    hintText: 'ایمیل',
                                  ),

                                  style: TextStyle(),
                                  textAlign: TextAlign.right,
                                  controller: _controllerEmail,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: InkWell(
                                  child: Container(
                                    height: 50,
                                    width: 280,
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
                                            'ارسال کد تایید',
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
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ResetPassword(
                                          title: widget.title,
                                          drawerTitle: widget.drawerTitle,
                                          /* localStorageMobile:
                                              widget.localStorageMobile,
                                          localStorageWeb:
                                              widget.localStorageWeb, */
                                          email: _controllerEmail.text.trim(),
                                        ),
                                      ),
                                    );
                                    /*sendOTP(
                                        _controllerEmail.text.toString(),
                                        widget.localStorageMobile,
                                        http.Client(),
                                        context);*/
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "در صورتی که کد فعالسازی را در پوشه Inbox مشاهده نکردید، پوشه Spam را چک بفرمایید.",
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "لطفا توجه داشته باشید، ممکن است ارسال کد فعالسازی تا 5 دقیقه تاخیر داشته باشید.",
                            style: TextStyle(),
                            textAlign: TextAlign.center,
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
                                        name: '',
                                      ),
                                    ),
                                  );
                                },
                              ),
                              InkWell(
                                child: Text(
                                  'لاگین',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
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
                              InkWell(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
