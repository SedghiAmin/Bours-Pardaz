// ignore_for_file: unused_import

import 'dart:convert';

import 'package:bourse_pardaz/class/Version.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bourse_pardaz/class/IndexItems.dart';
import 'package:http/http.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<List<IndexItems>> fetchItems(Client client) async {
  String url =
      'https://s3.ir-thr-at1.arvanstorage.com/boursepardaz/indexes.json';
  final response = await client.get(Uri.parse(url));
  //return parseItems(response);
  return compute(parseItems, utf8.decode(response.bodyBytes));
}

List<IndexItems> parseItems(String response) {
  final parsed = json.decode(response).cast<Map<String, dynamic>>();

  return parsed.map<IndexItems>((json) => IndexItems.fromJson(json)).toList();
}

Future<List<Version>> fetchVersion(Client client) async {
  String url =
      'https://s3.ir-thr-at1.arvanstorage.com/boursepardaz/version.json';
  final response = await client.get(Uri.parse(url));
  //return parseItems(response);
  return compute(parseVersion, utf8.decode(response.bodyBytes));
}

List<Version> parseVersion(String response) {
  final parsed = json.decode(response).cast<Map<String, dynamic>>();

  return parsed.map<Version>((json) => Version.fromJson(json)).toList();
}

class Indexes extends StatefulWidget {
  @override
  _IndexesState createState() => _IndexesState();
}

class _IndexesState extends State<Indexes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        FutureBuilder(
          future: fetchVersion(Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) Text('مشکل در برقراری ارتباط با سرور');

            return snapshot.hasData
                ? ChechVersion(items: snapshot.data as List<Version>)
                : Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                      Text("بررسی آخرین نسخه منتشر شده ..."),
                    ],
                  );
          },
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    'عنوان',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Color(0xff318d90), fontSize: 18),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 5,
              child: Text(
                'مقدار',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff318d90), fontSize: 18),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 5,
              child: Text(
                'تغییر',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff318d90), fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 5,
                child: Text(
                  'درصد',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff318d90), fontSize: 18),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: FutureBuilder(
            future: fetchItems(Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) Text('مشکل در بازخوانی اطلاعات از سرور');

              return snapshot.hasData
                  ? GenerateTable(items: snapshot.data as List<IndexItems>)
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
        ),
      ],
    );
  }
}

class GenerateTable extends StatelessWidget {
  final List<IndexItems> items;

  GenerateTable({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //print(items.length);
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        //print(index);
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Text(
                    items[index].symbol,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  child: items[index].symbol == "تاریخ بروزرسانی"
                      ? Container(
                          color: Color(0xffeaddd4),
                          child: Text(
                            DateTime.parse(items[index].value)
                                .toPersianDateStr(showDayStr: true),
                            style: TextStyle(fontSize: 9),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Text(
                          NumberUtility.seRagham(
                            NumberUtility.changeDigit(
                                items[index].value, NumStrLanguage.Farsi),
                          ),
                          style: TextStyle(fontSize: 13),
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                        ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  child: items[index].symbol == "تاریخ بروزرسانی"
                      ? Container(
                          child: Text(
                            '-',
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Container(
                          child: double.parse(items[index].dif) > 0
                              ? Text(
                                  NumberUtility.seRagham(
                                    NumberUtility.changeDigit(
                                        items[index].dif, NumStrLanguage.Farsi),
                                  ),
                                  style: TextStyle(
                                      color: Color(0xff318d90), fontSize: 13),
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  NumberUtility.seRagham(
                                    NumberUtility.changeDigit(
                                        (items[index].dif).replaceAll('-', ''),
                                        NumStrLanguage.Farsi),
                                  ),
                                  style: TextStyle(
                                      color: Color(0xffff0000), fontSize: 13),
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                ),
                        ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  child: items[index].symbol == "تاریخ بروزرسانی"
                      ? Container(
                          child: Text(
                            '-',
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width / 5,
                          child: double.parse(items[index].prc) > 0
                              ? Text(
                                  NumberUtility.changeDigit(
                                      items[index].prc, NumStrLanguage.Farsi),
                                  style: TextStyle(
                                      color: Color(0xff318d90), fontSize: 13),
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  NumberUtility.changeDigit(
                                      (items[index].prc).replaceAll('-', ''),
                                      NumStrLanguage.Farsi),
                                  style: TextStyle(
                                      color: Color(0xffff0000), fontSize: 13),
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ChechVersion extends StatelessWidget {
  final List<Version> items;

  ChechVersion({
    Key? key,
    required this.items,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          children: [
            if ((items[0].lastVersion) == '3.2')
              Center(
                child: Text(
                  'محتوای برنامه حداکثر تا ساعت 17:30 هر روز کاری بروز‌رسانی میشود.',
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              )
            else
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.archive,
                        color: Color(0xff085479),
                      ),
                      Flexible(
                        child: GestureDetector(
                          child: Center(
                            child: Text(
                              "جهت بروزرسانی برنامه از کافه بازار اقدام نمایید ...",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
