import 'dart:convert';

import 'package:bourse_pardaz/DescriptionSystems.dart';
import 'package:bourse_pardaz/class/AMitems.dart';
import 'package:bourse_pardaz/widgets/BottomNav.dart';
import 'package:bourse_pardaz/widgets/FloatingBottomNav.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bourse_pardaz/widgets/MainDrawer.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
//import 'package:shared_preferences/shared_preferences.dart';

Future<List<AMitems>> fetchItems(Client client) async {
  String url =
      'https://s3.ir-thr-at1.arvanstorage.com/boursepardaz/vip/1/strategy/AM.json';
  final response = await client.get(Uri.parse(url));
  //return parseItems(response);
  return compute(parseItems, utf8.decode(response.bodyBytes));
}

List<AMitems> parseItems(String response) {
  final parsed = json.decode(response).cast<Map<String, dynamic>>();

  return parsed.map<AMitems>((json) => AMitems.fromJson(json)).toList();
}

class AMresult extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt; */
  final String name;
  AMresult(
      {Key? key,
      required this.title,
      required this.drawerTitle,
     /*  required this.localStorageMobile,
      required this.localStorageWeb,
      required this.jwt, */
      required this.name})
      : super(key: key);

  @override
  _AMresultState createState() => _AMresultState();
}

class _AMresultState extends State<AMresult> {
  Widget build(BuildContext context) {
    return WillPopScope(
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
                          builder: (context) => DescriptionSystems(
                            title: widget.title,
                            drawerTitle: widget.drawerTitle,
                            description: '',
                            filter: 'AM',
                            filterTitle: 'ADX(14) + MACD(12,26,9)',
                            /* localStorageMobile: widget.localStorageMobile,
                            localStorageWeb: widget.localStorageWeb,
                            jwt: widget.jwt, */
                            name: widget.name,
                            pgRes: MaterialPageRoute(
                              builder: (context) => AMresult(
                                drawerTitle: widget.drawerTitle,
                                title: widget.title,
                              /*   localStorageMobile: widget.localStorageMobile,
                                localStorageWeb: widget.localStorageWeb,
                                jwt: widget.jwt, */
                                name: widget.name,
                              ),
                            ),
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
        body: Stack(
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
                        height: 56,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 6,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    'نماد',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Color(0xff318d90), fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 6,
                              child: Column(
                                children: [
                                  Text(
                                    'main',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff318d90), fontSize: 14),
                                  ),
                                  Text(
                                    'signal',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        backgroundColor: Color(0xffeaddd4),
                                        color: Color(0xff318d90),
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 6,
                              child: Column(
                                children: [
                                  Text(
                                    'DI+',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff318d90), fontSize: 14),
                                    textDirection: TextDirection.ltr,
                                  ),
                                  Text(
                                    'DI-',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        backgroundColor: Color(0xffeaddd4),
                                        color: Color(0xff318d90),
                                        fontSize: 14),
                                    textDirection: TextDirection.ltr,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 6,
                              child: Text(
                                'ADX',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff318d90), fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 6,
                                child: Text(
                                  'تاریخ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff318d90), fontSize: 14),
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
                        future: fetchItems(Client()),
                        builder: (context, snapshot) {
                          if (snapshot.hasError)
                            print('مشکل در برقراری ارتباط با سرور');

                          return snapshot.hasData
                              ? GenerateCard(
                                  items: snapshot.data as List<AMitems>)
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: CircularProgressIndicator(),
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
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //alignment: Alignment.topCenter,
              padding: new EdgeInsets.only(top: 10, right: 20.0, left: 20.0),
              width: MediaQuery.of(context).size.width / 1.2,
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
                        'ADX(14) + MACD(12,26,9)',
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
        floatingActionButton: FloatingBottomNav(
          title: widget.title,
          drawerTitle: widget.drawerTitle,
         /*  localStorageMobile: widget.localStorageMobile,
          localStorageWeb: widget.localStorageWeb,
          jwt: widget.jwt, */
          name: widget.name,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNav(
          title: widget.title,
          drawerTitle: widget.drawerTitle,
          navActive: 3,
     /*      localStorageMobile: widget.localStorageMobile,
          localStorageWeb: widget.localStorageWeb,
          jwt: widget.jwt, */
          name: widget.name,
        ),
      ),
    );
  }
}

class GenerateCard extends StatelessWidget {
  final List<AMitems> items;

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
                    width: MediaQuery.of(context).size.width / 6,
                    child: Text(
                      NumberUtility.changeDigit(
                          (index + 1).toString() + ' - ' + items[index].symbol,
                          NumStrLanguage.Farsi),
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                    child: Column(
                      children: [
                        Text(
                          NumberUtility.seRagham(
                            NumberUtility.changeDigit(
                                items[index].macd, NumStrLanguage.Farsi),
                          ),
                          style: TextStyle(
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          NumberUtility.seRagham(
                            NumberUtility.changeDigit(
                                items[index].signal, NumStrLanguage.Farsi),
                          ),
                          style: TextStyle(
                            fontSize: 10,
                            backgroundColor: Color(0xffeaddd4),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                    child: Column(
                      children: [
                        Text(
                          NumberUtility.seRagham(
                            NumberUtility.changeDigit(
                                items[index].diPlus, NumStrLanguage.Farsi),
                          ),
                          style: TextStyle(
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          NumberUtility.seRagham(
                            NumberUtility.changeDigit(
                                items[index].diMinus, NumStrLanguage.Farsi),
                          ),
                          style: TextStyle(
                            fontSize: 10,
                            backgroundColor: Color(0xffeaddd4),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                    child: Text(
                      NumberUtility.seRagham(
                        NumberUtility.changeDigit(
                            items[index].adx, NumStrLanguage.Farsi),
                      ),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                    child: Text(
                      DateTime.parse((items[index].dt).replaceAll('.', '-'))
                          .toPersianDate(twoDigits: true),
                      style: TextStyle(fontSize: 11),
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
