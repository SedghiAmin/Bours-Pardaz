//import 'dart:html';

//import 'package:bourse_pardaz/class/UserLogin.dart';

/* import 'package:bourse_pardaz/widgets/LoginForm.dart';
import 'package:bourse_pardaz/widgets/SignUpForm.dart'; */
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:http/http.dart' as http;

import 'package:bourse_pardaz/widgets/FloatingBottomNav.dart';
//import 'package:bourse_pardaz/widgets/JwtChecker.dart';
import 'package:flutter/material.dart';
//import 'package:bourse_pardaz/widgets/MainDrawer.dart';
//import 'package:bourse_pardaz/widgets/Indexes.dart';
//import 'package:bourse_pardaz/widgets/IndexesF.dart';
// ignore: unused_import
import 'package:bourse_pardaz/widgets/ShowDate.dart';
//import 'package:bourse_pardaz/widgets/ShowDayName.dart';

import 'package:bourse_pardaz/functions/Funcs.dart';
import 'package:bourse_pardaz/widgets/BottomNav.dart';

// فارسی سازی اعداد راهنمای استفاده => https://pub.dev/packages/persian_number_utility
// ignore: unused_import
import 'package:persian_number_utility/persian_number_utility.dart';
//راهنمای استفاده => https://pub.dev/packages/jalali_calendar
//import 'package:jalali_calendar/jalali_calendar.dart';
//import 'package:persian_date/persian_date.dart';
//import 'package:shared_preferences/shared_preferences.dart';

/*Future<String> fetchMobileJWT(FlutterSecureStorage localStorageMobile,
    http.Client client, var context) async {
  final jwtKey = await localStorageMobile.read(key: 'jwt');
  final subscriptionKey = await localStorageMobile.read(key: 'subscription');
  DateTime dt = DateTime.parse(subscriptionKey!);
  if (jwtKey == null) {
    return '';
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
    return '';
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

class MainPage extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt; */
  final String name;

  MainPage({
    Key? key,
    required this.title,
    required this.drawerTitle,
    /* required this.localStorageMobile,
    required this.localStorageWeb,
    required this.jwt, */
    required this.name,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  Funcs funcs = Funcs();
  //PersianDate pDate = PersianDate();
  String dateNow = DateTime.now().toString();

  @override
  Widget build(
    BuildContext context,
  ) {
    return GenerateMainPage(
      title: widget.title,
      drawerTitle: widget.drawerTitle,
      /* localStorageMobile: widget.localStorageMobile,
      localStorageWeb: widget.localStorageWeb,
      jwt: widget.jwt, */
      name: widget.name,
    );
  }
}

class GenerateMainPage extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt; */
  final String name;

  GenerateMainPage({
    Key? key,
    required this.title,
    required this.drawerTitle,
    /* required this.localStorageMobile,
    required this.localStorageWeb,
    required this.jwt, */
    required this.name,
  }) : super(key: key);

  @override
  _GenerateMainPageState createState() => _GenerateMainPageState();
}

class _GenerateMainPageState extends State<GenerateMainPage> {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          backgroundColor: Color(0xff085479),
          extendBody: true,
          /*appBar: AppBar(
            iconTheme: new IconThemeData(color: Color(0xffffffff)),
            title: Text(
              widget.title,
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              Navigator.canPop(context)
                  ? Tooltip(
                      message: 'صفحه قبل',
                      child: IconButton(
                        icon: new Icon(Icons.arrow_back),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    )
                  : Tooltip(
                      message: 'صفحه قبل',
                      child: IconButton(
                        icon: new Icon(Icons.arrow_back),
                        onPressed: () => {},
                      ),
                    )
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[Color(0xff085479), Color(0xff85c9e0)],
                ),
              ),
            ),
          ),
          drawer: MainDrawer(
            title: widget.title,
            drawerTitle: widget.drawerTitle,
            /* localStorageMobile: widget.localStorageMobile,
            localStorageWeb: widget.localStorageWeb,
            jwt: widget.jwt, */
            name: widget.name,
          ),*/
          body: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image(
                    height:
                        (MediaQuery.of(context).size.width ~/ 1.5).toDouble(),
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
                Text('سامانه تحلیل داده‌های بورس پرداز',
                    style: TextStyle(color: Colors.white)),
                /*Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    //mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /* widget.name == ""
                          ? Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginForm(
                                            title: widget.title,
                                            drawerTitle: widget.drawerTitle,
                                            /* localStorageMobile:
                                                widget.localStorageMobile,
                                            localStorageWeb:
                                                widget.localStorageWeb, */
                                          ),
                                        ),
                                      ),
                                    },
                                    child: Text(' ورود ',
                                        style: TextStyle(
                                            backgroundColor: Color(0xffeaddd4))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30.0),
                                    child: GestureDetector(
                                      onTap: () => {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SignUpForm(
                                              title: widget.title,
                                              drawerTitle: widget.drawerTitle,
                                              /* localStorageMobile:
                                                  widget.localStorageMobile,
                                              localStorageWeb:
                                                  widget.localStorageWeb, */
                                            ),
                                          ),
                                        ),
                                      },
                                      child: Text(' ثبت نام ',
                                          style: TextStyle(
                                              backgroundColor:
                                                  Color(0xffeaddd4))),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Text(
                              "درود" + " " + widget.name + " " + "عزیز",
                            ), */
                      Container(
                        //color: Colors.amberAccent,
                        width: MediaQuery.of(context).size.width * 0.40,
                        //child: ShowDate(dateTime: DateTime.now())),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            DateTime.now().toPersianDateStr(showDayStr: true),
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),

                      /*Container(
                          //color: Colors.blue,
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: ShowTime(dateTime: DateTime.now())),*/
                    ],
                  ),
                ),
                TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        'بورس',
                        style: TextStyle(
                          color: Color(0xff085479),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'فرابورس',
                        style: TextStyle(
                          color: Color(0xff085479),
                        ),
                      ),
                    ),
                    //Tab(icon: Icon(Icons.directions_bike)),
                  ],
                ),
                Expanded(
                  child: Container(
                    //color: Colors.yellow,
                    child: TabBarView(
                      children: [
                        Indexes(),
                        IndexesF(),
                      ],
                    ),
                  ),
                ),*/
              ],
            ),
          ),
          floatingActionButton: FloatingBottomNav(
            title: widget.title,
            drawerTitle: widget.drawerTitle,
            /* localStorageMobile: widget.localStorageMobile,
            localStorageWeb: widget.localStorageWeb,
            jwt: widget.jwt, */
            name: widget.name,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNav(
            title: widget.title,
            drawerTitle: widget.drawerTitle,
            navActive: 5,
            /*localStorageMobile: widget.localStorageMobile,
            localStorageWeb: widget.localStorageWeb,
            jwt: widget.jwt, */
            name: widget.name,
          ),
        ),
      ),
    );
  }
}
