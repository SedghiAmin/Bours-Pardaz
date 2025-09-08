import 'dart:convert';

import 'package:bourse_pardaz/MainPage.dart';
import 'package:bourse_pardaz/class/Version.dart';
import 'package:bourse_pardaz/widgets/MainDrawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
//import 'package:shared_preferences/shared_preferences.dart';

Future<List<Version>> fetchItems(Client client) async {
  String url =
      'https://s3.ir-thr-at1.arvanstorage.com/boursepardaz/version.json';
  final response = await client.get(Uri.parse(url));
  //return parseItems(response);
  return compute(parseItems, utf8.decode(response.bodyBytes));
}

List<Version> parseItems(String response) {
  final parsed = json.decode(response).cast<Map<String, dynamic>>();

  return parsed.map<Version>((json) => Version.fromJson(json)).toList();
}

class About extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt; */
  final String name;
  About(
      {Key? key,
      required this.title,
      required this.drawerTitle,
      /* required this.localStorageMobile,
      required this.localStorageWeb,
      required this.jwt, */
      required this.name})
      : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
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
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  )
                : Tooltip(
                    message: 'صفحه قبل',
                    child: IconButton(
                      icon: new Icon(Icons.arrow_back),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(
                            title: widget.title,
                            drawerTitle: widget.drawerTitle,
                            /* /* localStorageMobile: widget.localStorageMobile,
                            localStorageWeb: widget.localStorageWeb,
                            jwt: widget.jwt, */ */
                            name: widget.name,
                          ),
                        ),
                      ),
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
            Expanded(
              child: ListView(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Image(
                          image: AssetImage('assets/images/logo.png'),
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Text(
                        'بورس پرداز',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'نسخه نصب شده بر روی سیستم شما: 3.2',
                        style: TextStyle(),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: fetchItems(Client()),
                    builder: (context, snapshot) {
                      if (snapshot.hasError)
                        Text('مشکل در برقراری ارتباط با سرور');

                      return snapshot.hasData
                          ? ChechVersion(
                              items: snapshot.data as List<Version>,
                            )
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, right: 20, left: 20.0),
                      child: Text(
                        'شما میتوانید برای دریافت واچ لیست‌های معرفی شده در تایم بازار، از طریق کانال‌های ارتباطی زیر با من در ارتباط باشید.' /*+
                            '\n' +
                            'برای استفاده از این اپلیکیشن بر روی سیستم عامل‌ ios و دستگاه‌های Apple از وب اپلیکیشن bourspardaz.ir استفاده نمایید.'*/
                        ,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, right: 20, left: 20.0),
                      child: Text(
                        'برای دریافت نوتیفیکیشن‌های برنامه، از نصب و فعال بودن برنامه Google Play Services اطمینان حاصل فرمایید.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Image(
                      height: 300,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainPage(
                              title: widget.title,
                              drawerTitle: widget.drawerTitle,
                              /* localStorageMobile: widget.localStorageMobile,
                              localStorageWeb: widget.localStorageWeb,
                              jwt: widget.jwt, */
                              name: widget.name,
                            ),
                          ));
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Color(0xffeaddd4),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('کلیه حقوق این برنامه متعلق به '),
                            Text(
                              'امین صدقی ',
                              style: TextStyle(
                                color: Color(0xff085479),
                              ),
                            ),
                            Text('می‌باشد'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textDirection: TextDirection.ltr,
                          children: [
                            Container(
                              width: 22.0,
                              height: 22.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                //color: Colors.white,
                                image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage('assets/images/telegram.png'),
                                ),
                              ),
                            ),
                            Text(
                              '09127286092',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Icon(
                                Icons.email_outlined,
                                color: Color(0xff085479),
                              ),
                            ),
                            Text('sedghi.amin@gmail.com')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
              Row(
                children: [
                  Icon(
                    Icons.assignment_turned_in,
                    color: Color(0xff318d90),
                  ),
                  Text(' شما در حال استفاده از آخرین نسخه منتشر شده میباشید.'),
                ],
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
                          onTap: () {},
                          child: Text(
                            "لطفا برنامه را از کافه بازار آپدیت نمایید ....",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
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
