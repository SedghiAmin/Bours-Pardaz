import 'dart:convert';

import 'package:bourse_pardaz/Description.dart';
import 'package:bourse_pardaz/widgets/BottomNav.dart';
import 'package:bourse_pardaz/widgets/FloatingBottomNav.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bourse_pardaz/widgets/MainDrawer.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:bourse_pardaz/class/BearItems.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
//import 'package:shared_preferences/shared_preferences.dart';

Future<List<BearItems>> fetchItems(Client client) async {
  String url =
      'https://s3.ir-thr-at1.arvanstorage.com/boursepardaz/vip/1/indicators/daily/bearPower.json';
  final response = await client.get(Uri.parse(url));
  //if (response.statusCode == 200)
  return compute(parseItems, utf8.decode(response.bodyBytes));
}

Future<List<BearItems>> fetchWeeklyItems(Client client) async {
  String url =
      'https://s3.ir-thr-at1.arvanstorage.com/boursepardaz/vip/1/indicators/weekly/bearPower.json';
  final response = await client.get(Uri.parse(url));
  //if (response.statusCode == 200)
  return compute(parseItems, utf8.decode(response.bodyBytes));
}

Future<List<BearItems>> fetchMonthlyItems(Client client) async {
  String url =
      'https://bourspardaz.s3.ir-tbz-sh1.arvanstorage.com/indicators/monthly/bearPower.json';
  final response = await client.get(Uri.parse(url));
  //if (response.statusCode == 200)
  return compute(parseItems, utf8.decode(response.bodyBytes));
}

List<BearItems> parseItems(String response) {
  final parsed = json.decode(response).cast<Map<String, dynamic>>();

  return parsed.map<BearItems>((json) => BearItems.fromJson(json)).toList();
}

class BearMainPage extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt; */
  final String name;
  BearMainPage(
      {Key? key,
      required this.title,
      required this.drawerTitle,
      /* required this.localStorageMobile,
      required this.localStorageWeb,
      required this.jwt, */
      required this.name})
      : super(key: key);

  @override
  _BearMainPageState createState() => _BearMainPageState();
}

class _BearMainPageState extends State<BearMainPage> {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          appBar: AppBar(
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
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Description(
                              title: widget.title,
                              drawerTitle: widget.drawerTitle,
                              indicator: 'BearPower',
                              indicatorTitle: 'اندیکاتور Bears Power',
                              pgRes: MaterialPageRoute(
                                builder: (context) => BearMainPage(
                                  drawerTitle: widget.drawerTitle,
                                  title: widget.title,
                                  /* localStorageMobile: widget.localStorageMobile,
                                  localStorageWeb: widget.localStorageWeb,
                                  jwt: widget.jwt, */
                                  name: widget.name,
                                ),
                              ),
                              /* localStorageMobile: widget.localStorageMobile,
                              localStorageWeb: widget.localStorageWeb,
                              jwt: widget.jwt, */
                              name: widget.name,
                            ),
                          ),
                        ),
                        //Navigator.of(context).pop(),
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
          ),
          body: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'ماهانه',
                      style: TextStyle(
                        color: Color(0xff085479),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'هفتگی',
                      style: TextStyle(
                        color: Color(0xff085479),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'روزانه',
                      style: TextStyle(
                        color: Color(0xff085479),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Container(
                                      height: 40.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              child: Text(
                                                'نماد',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: Color(0xff318d90),
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            child: Text(
                                              'Bears',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xff318d90),
                                                  fontSize: 14),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              child: Text(
                                                'تاریخ',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff318d90),
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 0,
                                  ),
                                  Expanded(
                                    child: FutureBuilder(
                                      future: fetchMonthlyItems(Client()),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError) {
                                          print(
                                              'مشکل در برقراری ارتباط با سرور');
                                        }

                                        return snapshot.hasData
                                            ? GenerateCard(
                                                items: snapshot.data
                                                    as List<BearItems>)
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                  Text("لطفا شکیبا باشید ..."),
                                                ],
                                              );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            //alignment: Alignment.topCenter,
                            padding: new EdgeInsets.only(
                                top: 10, right: 20.0, left: 20.0),
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: new Container(
                              height: 40.0,
                              width: MediaQuery.of(context).size.width,
                              child: new Card(
                                color: Color(0xffeaddd4),
                                elevation: 4.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'اندیکاتور Bears Power',
                                      style: TextStyle(
                                        color: Color(0xff318d90),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      //Weekly ----------------------------------------------
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Container(
                                      height: 40.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              child: Text(
                                                'نماد',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: Color(0xff318d90),
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            child: Text(
                                              'Bears',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xff318d90),
                                                  fontSize: 14),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              child: Text(
                                                'تاریخ',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff318d90),
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 0,
                                  ),
                                  /*Expanded(
                                    child: FutureBuilder(
                                      future: fetchWeeklyItems(Client()),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError) {
                                          print(
                                              'مشکل در برقراری ارتباط با سرور');
                                        }

                                        return snapshot.hasData
                                            ? GenerateCard(
                                                items: snapshot.data
                                                    as List<BearItems>)
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                  Text("لطفا شکیبا باشید ..."),
                                                ],
                                              );
                                      },
                                    ),
                                  ),*/
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 30.0),
                                      child: Text(
                                          'جهت دریافت اطلاعات از طریق تلگرام درخواست دهید'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            //alignment: Alignment.topCenter,
                            padding: new EdgeInsets.only(
                                top: 10, right: 20.0, left: 20.0),
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: new Container(
                              height: 40.0,
                              width: MediaQuery.of(context).size.width,
                              child: new Card(
                                color: Color(0xffeaddd4),
                                elevation: 4.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'اندیکاتور Bears Power',
                                      style: TextStyle(
                                        color: Color(0xff318d90),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      //Monthly---------------------------------------------
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Container(
                                      height: 40.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              child: Text(
                                                'نماد',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: Color(0xff318d90),
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            child: Text(
                                              'Bears',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xff318d90),
                                                  fontSize: 14),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              child: Text(
                                                'تاریخ',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff318d90),
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 0,
                                  ),
                                  /*Expanded(
                                    child: FutureBuilder(
                                      future: fetchMonthlyItems(Client()),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError) {
                                          print(
                                              'مشکل در برقراری ارتباط با سرور');
                                        }

                                        return snapshot.hasData
                                            ? GenerateCard(
                                                items: snapshot.data
                                                    as List<BearItems>)
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                  Text("لطفا شکیبا باشید ..."),
                                                ],
                                              );
                                      },
                                    ),
                                  ),*/
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 30.0),
                                      child: Text(
                                          'جهت دریافت اطلاعات از طریق تلگرام درخواست دهید'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            //alignment: Alignment.topCenter,
                            padding: new EdgeInsets.only(
                                top: 10, right: 20.0, left: 20.0),
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: new Container(
                              height: 40.0,
                              width: MediaQuery.of(context).size.width,
                              child: new Card(
                                color: Color(0xffeaddd4),
                                elevation: 4.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'اندیکاتور Bears Power',
                                      style: TextStyle(
                                        color: Color(0xff318d90),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
            /* localStorageMobile: widget.localStorageMobile,
            localStorageWeb: widget.localStorageWeb,
            jwt: widget.jwt, */
            name: widget.name,
            navActive: 0,
          ),
        ),
      ),
    );
  }
}

class GenerateCard extends StatelessWidget {
  final List<BearItems> items;

  GenerateCard({Key? key, required this.items}) : super(key: key);

  Widget build(BuildContext context) {
    if (items.length > 0)
      return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Text(
                      NumberUtility.changeDigit(
                          (index + 1).toString() + ' - ' + items[index].symbol,
                          NumStrLanguage.Farsi),
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Text(
                      NumberUtility.seRagham(
                        NumberUtility.changeDigit(
                            items[index].bearPower, NumStrLanguage.Farsi),
                      ),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Text(
                      DateTime.parse((items[index].dt).replaceAll('.', '-'))
                          .toPersianDate(twoDigits: true),
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    else {
      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
              child: Container(
                color: Color(0xffeaddd4),
                child: Text('سیگنالی یافت نشد.'),
              ),
            ),
          ),
        ],
      );
    }
  }
}
