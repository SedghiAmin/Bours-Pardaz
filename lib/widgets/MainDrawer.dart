import 'dart:io';

import 'package:bourse_pardaz/About.dart';
//import 'package:bourse_pardaz/DebitCardInfo.dart';
import 'package:bourse_pardaz/MainPage.dart';
import 'package:bourse_pardaz/PriceAction.dart';
import 'package:bourse_pardaz/Tablokhani.dart';
//import 'package:bourse_pardaz/UnderConstruction.dart';
import 'package:bourse_pardaz/Systems.dart';
// ignore: unused_import
import 'package:bourse_pardaz/UnderConstruction.dart';
//import 'package:bourse_pardaz/widgets/JwtChecker.dart';
//import 'package:bourse_pardaz/widgets/LoginForm.dart';
//import 'package:bourse_pardaz/widgets/SignUpForm.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bourse_pardaz/Indicators.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http/http.dart' as http;

//import 'UserInfo.dart';

/*Future<String> fetchMobileJWT(FlutterSecureStorage localStorageMobile,
    http.Client client, var context) async {
  final jwtKey = await localStorageMobile.read(key: 'jwt');
  final subscriptionKey = await localStorageMobile.read(key: 'subscription');
  DateTime dt = DateTime.parse(subscriptionKey!);
  if (jwtKey == null) {
    return 'login';
    //print('Error from fetch JWT');
  }
  final checkJwt = await JwtChecker().checkJWT(jwtKey, client, context);
  if (checkJwt != '') {
    if (DateTime.now().isBefore(dt)) {
      return 'valid'; //have subscription
    } else {
      return 'notvalid'; //not have subscription
    }
  } else
    return 'login';
}

Future<String> fetchWebJWT(Future<SharedPreferences> _localStorageWeb,
    http.Client client, var context) async {
  SharedPreferences localStorageWeb = await _localStorageWeb;
  bool checkValue = localStorageWeb.containsKey('jwt');
  if (checkValue) {
    final jwtKey = localStorageWeb.getString('jwt');
    final subscriptionKey = localStorageWeb.getString('subscription');
    DateTime dt = DateTime.parse(subscriptionKey.toString());
    final checkJwt = await JwtChecker().checkJWT(jwtKey!, client, context);
    if (checkJwt != '') {
      if (DateTime.now().isBefore(dt)) {
        return 'valid'; //have subscription => واچ لیست
        //print('Error from fetch JWT');
      } else
        return 'notvalid'; //not have subscription => خرید اشتراک
    } else
      return 'waiting'; // => waiting
  } else
    return 'login'; // => لاگین
}*/

class MainDrawer extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt; */
  final String name;

  MainDrawer({
    Key? key,
    required this.title,
    required this.drawerTitle,
    /*required this.localStorageMobile,
    required this.localStorageWeb,
    required this.jwt, */
    required this.name,
  }) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Drawer(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.75,
                child: DrawerHeader(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 40.0,
                          height: 40.0,
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
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            widget.drawerTitle,
                            style: TextStyle(fontSize: 28, color: Colors.white),
                          ),
                        ),
                      ),
                      /* Expanded(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: 150,
                            //color: Colors.amber,
                            child: Row(
                              textDirection: TextDirection.ltr,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                !kIsWeb //mobileS
                                    ? FutureBuilder(
                                        future: fetchMobileJWT(
                                            widget.localStorageMobile,
                                            http.Client(),
                                            context),
                                        builder: (context, snapshot) {
                                          if (snapshot.data == 'valid' ||
                                              snapshot.data == 'notvalid')
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () => {
                                                    //Navigator.of(context).pop();
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            UserInfo(
                                                          title: widget.title,
                                                          drawerTitle: widget
                                                              .drawerTitle,
                                                          localStorageMobile: widget
                                                              .localStorageMobile,
                                                          localStorageWeb: widget
                                                              .localStorageWeb,
                                                          jwt: widget.jwt,
                                                          name: widget.name,
                                                        ),
                                                      ),
                                                    ),
                                                  },
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Color(
                                                                  0xffeaddd4))),
                                                  //color: Color(0xff318d90),
                                                  child: Text(
                                                    'پنل کاربران',
                                                    style: TextStyle(
                                                      color: Color(0xff318d90),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 20.0),
                                                  child: Container(
                                                    height: 34,
                                                    color: Color(0xffeaddd4),
                                                    child: InkWell(
                                                      child: Icon(
                                                        Icons.logout_outlined,
                                                        color:
                                                            Color(0xff318d90),
                                                      ),
                                                      onTap: () async {
                                                        await widget
                                                            .localStorageMobile
                                                            .delete(key: 'jwt');

                                                        //print("DELETE jwt");
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title: new Text(
                                                                  "خروج از برنامه !!"),
                                                              content: Text(
                                                                'شما از برنامه خارج شدید.',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              actions: <Widget>[
                                                                new TextButton(
                                                                  child:
                                                                      new Text(
                                                                    "قبول",
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    Navigator
                                                                        .pushReplacement(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                MainPage(
                                                                          drawerTitle:
                                                                              widget.drawerTitle,
                                                                          title:
                                                                              widget.title,
                                                                          localStorageMobile:
                                                                              widget.localStorageMobile,
                                                                          localStorageWeb:
                                                                              widget.localStorageWeb,
                                                                          jwt:
                                                                              '',
                                                                          name:
                                                                              '',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          else if (snapshot.data == 'login')
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () => {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginForm(
                                                          title: widget.title,
                                                          drawerTitle: widget
                                                              .drawerTitle,
                                                          localStorageMobile: widget
                                                              .localStorageMobile,
                                                          localStorageWeb: widget
                                                              .localStorageWeb,
                                                        ),
                                                      ),
                                                    ),
                                                  },
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Color(
                                                                  0xffeaddd4))),
                                                  //color: Color(0xff318d90),
                                                  child: Text(
                                                    'ورود',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff318d90),
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10.0),
                                                  child: ElevatedButton(
                                                    onPressed: () => {
                                                      Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              SignUpForm(
                                                            title: widget.title,
                                                            drawerTitle: widget
                                                                .drawerTitle,
                                                            localStorageMobile:
                                                                widget
                                                                    .localStorageMobile,
                                                            localStorageWeb: widget
                                                                .localStorageWeb,
                                                          ),
                                                        ),
                                                      ),
                                                    },
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Color(
                                                                    0xffeaddd4))),
                                                    //color: Color(0xff318d90),
                                                    child: Text(
                                                      'ثبت نام',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff318d90),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          else
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0, bottom: 10),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: ElevatedButton(
                                                  onPressed: () => {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            MainPage(
                                                          drawerTitle: widget
                                                              .drawerTitle,
                                                          title: widget.title,
                                                          localStorageMobile: widget
                                                              .localStorageMobile,
                                                          localStorageWeb: widget
                                                              .localStorageWeb,
                                                          jwt: widget.jwt,
                                                          name: widget.name,
                                                        ),
                                                      ),
                                                    ),
                                                  },
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Color(
                                                                  0xffeaddd4))),
                                                  //color: Color(0xff318d90),
                                                  child: Container(
                                                    width: 16,
                                                    height: 16,
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                ),
                                              ),
                                            );
                                        },
                                      )
                                    : FutureBuilder(
                                        //WEB
                                        future: fetchWebJWT(
                                            widget.localStorageWeb,
                                            http.Client(),
                                            context),
                                        builder: (context, snapshot) {
                                          if (snapshot.data == 'valid' ||
                                              snapshot.data == 'notvalid') {
                                            //print('snapshot.data: ' + snapshot.data);
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () => {
                                                    //Navigator.of(context).pop();
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            UserInfo(
                                                          title: widget.title,
                                                          drawerTitle: widget
                                                              .drawerTitle,
                                                          localStorageMobile: widget
                                                              .localStorageMobile,
                                                          localStorageWeb: widget
                                                              .localStorageWeb,
                                                          jwt: widget.jwt,
                                                          name: widget.name,
                                                        ),
                                                      ),
                                                    ),
                                                  },
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Color(
                                                                  0xffeaddd4))),
                                                  //color: Color(0xff318d90),
                                                  child: Text(
                                                    'پنل کاربران',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff318d90),
                                                        fontSize: 13),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 20.0),
                                                  child: Container(
                                                    height: 34,
                                                    color: Color(0xffeaddd4),
                                                    child: InkWell(
                                                      child: Icon(
                                                        Icons.logout_outlined,
                                                        color:
                                                            Color(0xff318d90),
                                                      ),
                                                      onTap: () async {
                                                        logOut();
                                                        //print("DELETE jwt");
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title: new Text(
                                                                  "خروج از برنامه !!"),
                                                              content: Text(
                                                                'شما از برنامه خارج شدید.',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              actions: <Widget>[
                                                                new TextButton(
                                                                  child:
                                                                      new Text(
                                                                    "قبول",
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    Navigator
                                                                        .pushReplacement(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                MainPage(
                                                                          drawerTitle:
                                                                              widget.drawerTitle,
                                                                          title:
                                                                              widget.title,
                                                                          localStorageMobile:
                                                                              widget.localStorageMobile,
                                                                          localStorageWeb:
                                                                              widget.localStorageWeb,
                                                                          jwt:
                                                                              '',
                                                                          name:
                                                                              '',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (snapshot.data == 'login')
                                            return Row(
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () => {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginForm(
                                                          title: widget.title,
                                                          drawerTitle: widget
                                                              .drawerTitle,
                                                          localStorageMobile: widget
                                                              .localStorageMobile,
                                                          localStorageWeb: widget
                                                              .localStorageWeb,
                                                        ),
                                                      ),
                                                    ),
                                                  },
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Color(
                                                                  0xffeaddd4))),
                                                  //color: Color(0xff318d90),
                                                  child: Text(
                                                    'ورود',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff318d90),
                                                        fontSize: 13),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10.0),
                                                  child: ElevatedButton(
                                                    onPressed: () => {
                                                      Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              SignUpForm(
                                                            title: widget.title,
                                                            drawerTitle: widget
                                                                .drawerTitle,
                                                            localStorageMobile:
                                                                widget
                                                                    .localStorageMobile,
                                                            localStorageWeb: widget
                                                                .localStorageWeb,
                                                          ),
                                                        ),
                                                      ),
                                                    },
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Color(
                                                                    0xffeaddd4))),
                                                    //color: Color(0xff318d90),
                                                    child: Text(
                                                      'ثبت نام',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff318d90),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          else
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0, bottom: 10),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: ElevatedButton(
                                                  onPressed: () => {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            MainPage(
                                                          drawerTitle: widget
                                                              .drawerTitle,
                                                          title: widget.title,
                                                          localStorageMobile: widget
                                                              .localStorageMobile,
                                                          localStorageWeb: widget
                                                              .localStorageWeb,
                                                          jwt: widget.jwt,
                                                          name: widget.name,
                                                        ),
                                                      ),
                                                    ),
                                                  },
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Color(
                                                                  0xffeaddd4))),
                                                  //color: Color(0xff318d90),
                                                  child: Container(
                                                    width: 16,
                                                    height: 16,
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                ),
                                              ),
                                            );
                                        },
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ), */
                    ],
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff085479), Color(0xff85c9e0)],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.home_outlined,
                            color: Color(0xff318d90),
                          ),
                        ),
                        InkWell(
                          child: Text(
                            "پیش‌خوان",
                            style: TextStyle(fontSize: 17),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(
                                  drawerTitle: widget.drawerTitle,
                                  title: widget.title,
                                  /* localStorageMobile: widget.localStorageMobile,
                                  localStorageWeb: widget.localStorageWeb,
                                  jwt: widget.jwt, */
                                  name: widget.name,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.multiline_chart,
                            color: Color(0xff318d90),
                          ),
                        ),
                        InkWell(
                          child: Text(
                            "اندیکاتورها",
                            style: TextStyle(fontSize: 17),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Indicators(
                                  title: widget.title,
                                  drawerTitle: widget.drawerTitle,
                                  /* localStorageMobile: widget.localStorageMobile,
                                  localStorageWeb: widget.localStorageWeb,
                                  jwt: widget.jwt, */
                                  name: widget.name,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.swap_vert,
                            color: Color(0xff318d90),
                          ),
                        ),
                        InkWell(
                          child: Text(
                            "پرایس اکشن",
                            style: TextStyle(fontSize: 17),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PriceAction(
                                  title: widget.title,
                                  drawerTitle: widget.drawerTitle,
                                  /* localStorageMobile: widget.localStorageMobile,
                                  localStorageWeb: widget.localStorageWeb,
                                  jwt: widget.jwt, */
                                  name: widget.name,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.view_comfy_alt_outlined,
                            color: Color(0xff318d90),
                          ),
                        ),
                        InkWell(
                          child: Text(
                            "تابلو خوانی",
                            style: TextStyle(fontSize: 17),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Tablokhani(
                                  title: widget.title,
                                  drawerTitle: widget.drawerTitle,
                                  /* localStorageMobile: widget.localStorageMobile,
                                  localStorageWeb: widget.localStorageWeb,
                                  jwt: widget.jwt, */
                                  name: widget.name,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.stream,
                            color: Color(0xff318d90),
                          ),
                        ),
                        InkWell(
                          child: Text(
                            "استراتژی‌های معاملاتی",
                            style: TextStyle(fontSize: 17),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Systems(
                                  title: widget.title,
                                  drawerTitle: widget.drawerTitle,
                                  /* localStorageMobile: widget.localStorageMobile,
                                  localStorageWeb: widget.localStorageWeb,
                                  jwt: widget.jwt, */
                                  name: widget.name,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  /*Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.subscriptions_outlined,
                            color: Color(0xff318d90),
                          ),
                        ),
                        InkWell(
                          child: Text(
                            "خرید اشتراک",
                            style: TextStyle(fontSize: 17),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DebitCardInfo(
                                  title: widget.title,
                                  drawerTitle: widget.drawerTitle,
                                  /* localStorageMobile: widget.localStorageMobile,
                                  localStorageWeb: widget.localStorageWeb,
                                  jwt: widget.jwt, */
                                  name: widget.name,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),*/
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.info_outline,
                            color: Color(0xff318d90),
                          ),
                        ),
                        InkWell(
                          child: Text(
                            "درباره برنامه",
                            style: TextStyle(fontSize: 17),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => About(
                                  title: widget.title,
                                  drawerTitle: widget.drawerTitle,
                                  /* localStorageMobile: widget.localStorageMobile,
                                  localStorageWeb: widget.localStorageWeb,
                                  jwt: widget.jwt, */
                                  name: widget.name,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.exit_to_app,
                            color: Color(0xff318d90),
                          ),
                        ),
                        InkWell(
                          child: Text(
                            "بستن برنامه",
                            style: TextStyle(fontSize: 17),
                          ),
                          onTap: () => exit(0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  color: Color(0xffeaddd4),
                  child: Text(
                    'Version 3.2',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  logOut() async {
    //SharedPreferences localStorageWeb = await SharedPreferences.getInstance();
    //localStorageWeb.remove('jwt');
  }
}
