import 'dart:convert';

import 'package:bourse_pardaz/DescriptionTablokhani.dart';
import 'package:bourse_pardaz/class/SafItems.dart';
import 'package:bourse_pardaz/widgets/BottomNav.dart';
import 'package:bourse_pardaz/widgets/FloatingBottomNav.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bourse_pardaz/widgets/MainDrawer.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
//import 'package:shared_preferences/shared_preferences.dart';

Future<List<SafItems>> fetchItems(Client client) async {
  String url =
      'https://s3.ir-thr-at1.arvanstorage.com/boursepardaz/vip/1/tablo/SafeForosh2.json';
  final response = await client.get(Uri.parse(url));
  //return parseItems(response);
  return compute(parseItems, utf8.decode(response.bodyBytes));
}

List<SafItems> parseItems(String response) {
  final parsed = json.decode(response).cast<Map<String, dynamic>>();

  return parsed.map<SafItems>((json) => SafItems.fromJson(json)).toList();
}

class SafeForoshResult extends StatefulWidget {
  final String title;
  final String drawerTitle;
 /*  final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt; */
  final String name;
  SafeForoshResult(
      {Key? key,
      required this.title,
      required this.drawerTitle,
      /* required this.localStorageMobile,
      required this.localStorageWeb,
      required this.jwt, */
      required this.name})
      : super(key: key);

  @override
  _SafeForoshResultState createState() => _SafeForoshResultState();
}

class _SafeForoshResultState extends State<SafeForoshResult> {
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
                          builder: (context) => DescriptionTablokhani(
                            title: widget.title,
                            drawerTitle: widget.drawerTitle,
                            description: '',
                            filter: 'Safe Forosh',
                            filterTitle: 'در آستانه صف فروش',
                            /* localStorageMobile: widget.localStorageMobile,
                            localStorageWeb: widget.localStorageWeb,
                            jwt: widget.jwt, */
                            name: widget.name,
                            pgRes: MaterialPageRoute(
                              builder: (context) => SafeForoshResult(
                                drawerTitle: widget.drawerTitle,
                                title: widget.title,
                                /* localStorageMobile: widget.localStorageMobile,
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
        body: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: new EdgeInsets.only(top: 10, right: 5.0),
                width: MediaQuery.of(context).size.width / 1.5,
                height: 50,
                child: new Card(
                  color: Color(0xffeaddd4),
                  elevation: 4.0,
                  child: Center(
                    child: Text(
                      'در آستانه صف فروش',
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
            /*Expanded(
              child: FutureBuilder(
                future: fetchItems(Client()),
                builder: (context, snapshot) {
                  if (snapshot.hasError) Text('مشکل در برقراری ارتباط با سرور');

                  return snapshot.hasData
                      ? GenerateCard(items: snapshot.data as List<SafItems>)
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
                child: Text('جهت دریافت اطلاعات از طریق تلگرام درخواست دهید'),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNav(
          title: widget.title,
          drawerTitle: widget.drawerTitle,
          navActive: 2,
          /* localStorageMobile: widget.localStorageMobile,
          localStorageWeb: widget.localStorageWeb,
          jwt: widget.jwt, */
          name: widget.name,
        ),
      ),
    );
  }
}

class GenerateCard extends StatefulWidget {
  final List<SafItems> items;

  GenerateCard({Key? key, required this.items}) : super(key: key);

  @override
  State<GenerateCard> createState() => _GenerateCardState();
}

class _GenerateCardState extends State<GenerateCard> {
  int? sortColumnIndex;
  bool isAscending = false;

  Widget build(BuildContext context) {
    if (widget.items.length > 0)
      return Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 10.0, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'مرتب سازی: ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff085479),
                      ),
                    ),
                    Text(
                      ' با لمس عنوان هر ستون',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      color: Color(0xffeaddd4),
                      child: Text(NumberUtility.changeDigit(
                              widget.items.length.toString(),
                              NumStrLanguage.Farsi) +
                          " " +
                          "مورد یافت شد."),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 15.0),
              child: ListView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      sortAscending: isAscending,
                      sortColumnIndex: sortColumnIndex,
                      horizontalMargin: 0,
                      columnSpacing: 0,
                      columns: [
                        DataColumn(
                          onSort: onSort,
                          label: Container(
                            width: MediaQuery.of(context).size.width / 8,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Text(
                                'نماد',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Color(0xff085479), fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        DataColumn(
                          onSort: onSort,
                          label: Container(
                            width: MediaQuery.of(context).size.width / 5,
                            child: Column(
                              children: [
                                Text(
                                  'حجم‌تقاضا',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff318d90), fontSize: 14),
                                ),
                                Text(
                                  'حجم‌عرضه',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff085479),
                                    fontSize: 14,
                                    backgroundColor: Color(0xffeaddd4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            width: MediaQuery.of(context).size.width / 5,
                            child: Column(
                              children: [
                                Text(
                                  'PLP',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff318d90), fontSize: 14),
                                ),
                                Text(
                                  'PCP',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff318d90),
                                    fontSize: 14,
                                    backgroundColor: Color(0xffeaddd4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DataColumn(
                          onSort: onSort,
                          label: Container(
                            width: MediaQuery.of(context).size.width / 5,
                            child: Column(
                              children: [
                                Text(
                                  'حجم',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff085479), fontSize: 14),
                                ),
                                Text(
                                  'حجم3روز',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff318d90),
                                      backgroundColor: Color(0xffeaddd4),
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            width: MediaQuery.of(context).size.width / 5,
                            child: Text(
                              'تاریخ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff318d90), fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                      rows: widget.items
                          .map(
                            ((element) => DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                8,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0),
                                          child: Text(
                                            NumberUtility.changeDigit(
                                                element.symbol,
                                                NumStrLanguage.Farsi),
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ), //Extracting from Map element the value
                                    DataCell(Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      child: Column(
                                        children: [
                                          Text(
                                            NumberUtility.changeDigit(
                                                element.dvol,
                                                NumStrLanguage.Farsi),
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                            textDirection: TextDirection.ltr,
                                          ),
                                          Text(
                                            NumberUtility.seRagham(
                                              NumberUtility.changeDigit(
                                                  element.ovol,
                                                  NumStrLanguage.Farsi),
                                            ),
                                            style: TextStyle(
                                              fontSize: 10,
                                              backgroundColor:
                                                  Color(0xffeaddd4),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    )),
                                    DataCell(
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: Column(
                                          children: [
                                            Text(
                                              NumberUtility.changeDigit(
                                                  element.plp,
                                                  NumStrLanguage.Farsi),
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.ltr,
                                            ),
                                            Text(
                                              NumberUtility.changeDigit(
                                                  element.pcp,
                                                  NumStrLanguage.Farsi),
                                              style: TextStyle(
                                                fontSize: 10,
                                                backgroundColor:
                                                    Color(0xffeaddd4),
                                              ),
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.ltr,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: Column(
                                          children: [
                                            Text(
                                              NumberUtility.seRagham(
                                                NumberUtility.changeDigit(
                                                    element.vol,
                                                    NumStrLanguage.Farsi),
                                              ),
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              NumberUtility.seRagham(
                                                NumberUtility.changeDigit(
                                                    element.vol3D,
                                                    NumStrLanguage.Farsi),
                                              ),
                                              style: TextStyle(
                                                fontSize: 10,
                                                backgroundColor:
                                                    Color(0xffeaddd4),
                                              ),
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.ltr,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: Text(
                                          DateTime.parse((element.dt)
                                                  .replaceAll('.', '-'))
                                              .toPersianDate(twoDigits: true),
                                          style: TextStyle(fontSize: 11),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      widget.items.sort(
          (row1, row2) => compareString(ascending, row1.symbol, row2.symbol));
    } else if (columnIndex == 1) {
      widget.items.sort((row1, row2) => compareDouble(
          ascending,
          double.parse((row1.ovol).replaceAll(RegExp(r"[^\s\w]"), '')),
          double.parse((row2.ovol).replaceAll(RegExp(r"[^\s\w]"), ''))));
    } else if (columnIndex == 3) {
      widget.items.sort((row1, row2) => compareDouble(
          ascending,
          double.parse((row1.vol).replaceAll(RegExp(r"[^\s\w]"), '')),
          double.parse((row2.vol).replaceAll(RegExp(r"[^\s\w]"), ''))));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  int compareDouble(bool ascending, double value1, double value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
