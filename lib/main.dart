import 'package:flutter/material.dart';
import 'package:bourse_pardaz/MainPage.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String appTitle = 'سامانه تحلیل داده‌های بورس پرداز';

  final String drawerTitle = 'بورس پرداز';

  //final _localStorageMobile = new FlutterSecureStorage();

  //final  _localStorageWeb = await SharedPreferences.getInstance();
  /*final Future<SharedPreferences> _localStorageWeb =
      SharedPreferences.getInstance();*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        fontFamily: 'Vazir',
        //primarySwatch: Colors.blue,
        //scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(
        title: appTitle,
        drawerTitle: drawerTitle,
        /* localStorageMobile: _localStorageMobile,
        localStorageWeb: _localStorageWeb,
        jwt: '', */
        name: '',
      ),
    );
  }
}
