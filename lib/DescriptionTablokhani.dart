//import 'package:bourse_pardaz/widgets/LoginForm.dart';
//import 'package:flutter/foundation.dart';
//import 'package:http/http.dart' as http;
import 'package:bourse_pardaz/Tablokhani.dart';
import 'package:bourse_pardaz/descriptions/Tablokhani/EnterMoney.dart';
import 'package:bourse_pardaz/descriptions/Tablokhani/ExitMoney.dart';
import 'package:bourse_pardaz/descriptions/Tablokhani/FinishPositive.dart';
import 'package:bourse_pardaz/descriptions/Tablokhani/PowerfulBuyer.dart';
import 'package:bourse_pardaz/descriptions/Tablokhani/LastPositive.dart';
import 'package:bourse_pardaz/descriptions/Tablokhani/Navasan.dart';
import 'package:bourse_pardaz/descriptions/Tablokhani/PowerfullSeller.dart';
import 'package:bourse_pardaz/descriptions/Tablokhani/Saat.dart';
import 'package:bourse_pardaz/descriptions/Tablokhani/SafeForosh.dart';
import 'package:bourse_pardaz/descriptions/Tablokhani/SafeKharid.dart';
import 'package:bourse_pardaz/descriptions/Tablokhani/SmartMoneyOutflow.dart';
import 'package:bourse_pardaz/descriptions/Tablokhani/SusVol.dart';
import 'package:bourse_pardaz/descriptions/Tablokhani/Tick.dart';
import 'package:bourse_pardaz/descriptions/Tablokhani/TrendUp.dart';
import 'package:bourse_pardaz/widgets/BottomNav.dart';
import 'package:bourse_pardaz/widgets/FloatingBottomNav.dart';
//import 'package:bourse_pardaz/widgets/JwtChecker.dart';
import 'package:bourse_pardaz/widgets/MainDrawer.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//import 'DebitCardInfo.dart';
//import 'MainPage.dart';
import 'descriptions/Tablokhani/SmartMoneyEntry.dart';
//import 'package:shared_preferences/shared_preferences.dart';

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

class DescriptionTablokhani extends StatefulWidget {
  final String title;
  final String drawerTitle;
  final String description;
  final String filter;
  final String filterTitle;
  final MaterialPageRoute pgRes;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt; */
  final String name;

  DescriptionTablokhani(
      {Key? key,
      required this.title,
      required this.drawerTitle,
      required this.description,
      required this.filter,
      required this.filterTitle,
      required this.pgRes,
      /* required this.localStorageMobile,
      required this.localStorageWeb,
      required this.jwt, */
      required this.name})
      : super(key: key);

  @override
  _DescriptionTablokhaniState createState() => _DescriptionTablokhaniState();
}

class _DescriptionTablokhaniState extends State<DescriptionTablokhani> {
  final ScrollController _scrollController = ScrollController();

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
                      onPressed: () => Navigator.push(
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
                      ), //Navigator.of(context).pop(),
                    ),
                  )
                : Tooltip(
                    message: 'صفحه قبل',
                    child: IconButton(
                      icon: new Icon(Icons.arrow_back),
                      onPressed: () => {},
                    ),
                  ),
          ],
          // actions: <Widget>[
          //   // add the icon to this list
          //   IconButton(
          //     icon: Icon(Icons.ac_unit),
          //     onPressed: () => Navigator.of(context).pop(),
          //   ),
          // ],
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Color(0xffffffff),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    widget.filterTitle,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff318d90)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Color(0xffffffff),
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollController,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: 1,
                    // ignore: missing_return
                    itemBuilder: (context, index) {
                      switch (widget.filter) {
                        // case 'Inverted Hammer':
                        //   {
                        //     return InvertedHammer();
                        //   }
                        //   break;
                        case 'Trend Up':
                          {
                            return TrendUp();
                          }

                        case 'Suspicious Volume':
                          {
                            return SusVol();
                          }

                        case 'Enter Money':
                          {
                            return EnterMoney();
                          }

                        case 'Exit Money':
                          {
                            return ExitMoney();
                          }

                        case 'Smart Money Entry':
                          {
                            return SmartMoneyEntry();
                          }

                        case 'Smart Money Outflow':
                          {
                            return SmartMoneyOutflow();
                          }

                        case 'Powerfull Buyer':
                          {
                            return PowerfullBuyer();
                          }

                        case 'Powerfull Seller':
                          {
                            return PowerfullSeller();
                          }

                        case 'Navasan':
                          {
                            return Navasan();
                          }

                        case 'Tick':
                          {
                            return Tick();
                          }

                        case 'Saat':
                          {
                            return Saat();
                          }

                        case 'Finish Positive':
                          {
                            return FinishPositive();
                          }

                        case 'Last Positive':
                          {
                            return LastPositive();
                          }

                        case 'Safe Kharid':
                          {
                            return SafeKharid();
                          }

                        case 'Safe Forosh':
                          {
                            return SafeForosh();
                          }
                        default:
                          {
                            return TrendUp();
                          }
                      }
                    },
                  ),
                ),
              ),
            ),
            /* Container(
              color: Color(0xffeaddd4),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 10,
                      left: 10,
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'توجه داشته باشید که نباید تنها به سیگنال‌های صادره از یک فیلتر اکتفا نمود؛ و بهتر است جهت تایید سیگنال‌ها از ابزارهای دیگر تحلیل تکنیکال و فاندامنتال استفاده نمایید.',
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  !kIsWeb //mobileS
                      ? FutureBuilder(
                          future: fetchMobileJWT(widget.localStorageMobile,
                              http.Client(), context),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data == 'notvalid')
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
                                            builder: (context) => DebitCardInfo(
                                              title: widget.title,
                                              drawerTitle: widget.drawerTitle,
                                              localStorageMobile:
                                                  widget.localStorageMobile,
                                              localStorageWeb:
                                                  widget.localStorageWeb,
                                              jwt: widget.jwt,
                                              name: widget.name,
                                            ),
                                          ),
                                        ),
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xff318d90))),
                                      //color: Color(0xff318d90),
                                      child: Text(
                                        'خرید اشتراک',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                );

                              if (snapshot.data == 'valid')
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, bottom: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: ElevatedButton(
                                      onPressed: () => {
                                        Navigator.pushReplacement(
                                            context, widget.pgRes),
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xff318d90))),
                                      //color: Color(0xff318d90),
                                      child: Text(
                                        'واچ لیست',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                );

                              if (snapshot.data == 'login' && widget.jwt == '')
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
                                            builder: (context) => LoginForm(
                                              title: widget.title,
                                              drawerTitle: widget.drawerTitle,
                                              localStorageMobile:
                                                  widget.localStorageMobile,
                                              localStorageWeb:
                                                  widget.localStorageWeb,
                                            ),
                                          ),
                                        ),
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xff318d90))),
                                      //color: Color(0xff318d90),
                                      child: Text(
                                        'لاگین کنید',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                );
                            } //waiting display
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, bottom: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ElevatedButton(
                                  onPressed: () => {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainPage(
                                          drawerTitle: widget.drawerTitle,
                                          title: widget.title,
                                          localStorageMobile:
                                              widget.localStorageMobile,
                                          localStorageWeb:
                                              widget.localStorageWeb,
                                          jwt: widget.jwt,
                                          name: widget.name,
                                        ),
                                      ),
                                    ),
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xff318d90))),
                                  //color: Color(0xff318d90),
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : FutureBuilder(
                          //WEB
                          future: fetchWebJWT(
                              widget.localStorageWeb, http.Client(), context),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data == 'notvalid')
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
                                            builder: (context) => DebitCardInfo(
                                              title: widget.title,
                                              drawerTitle: widget.drawerTitle,
                                              localStorageMobile:
                                                  widget.localStorageMobile,
                                              localStorageWeb:
                                                  widget.localStorageWeb,
                                              jwt: widget.jwt,
                                              name: widget.name,
                                            ),
                                          ),
                                        ),
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xff318d90))),
                                      //color: Color(0xff318d90),
                                      child: Text(
                                        'خرید اشتراک',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                );

                              if (snapshot.data == 'valid')
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, bottom: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: ElevatedButton(
                                      onPressed: () => {
                                        Navigator.pushReplacement(
                                            context, widget.pgRes),
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xff318d90))),
                                      //color: Color(0xff318d90),
                                      child: Text(
                                        'واچ لیست',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                );

                              if (snapshot.data == 'login' && widget.jwt == '')
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
                                            builder: (context) => LoginForm(
                                              title: widget.title,
                                              drawerTitle: widget.drawerTitle,
                                              localStorageMobile:
                                                  widget.localStorageMobile,
                                              localStorageWeb:
                                                  widget.localStorageWeb,
                                            ),
                                          ),
                                        ),
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xff318d90))),
                                      //color: Color(0xff318d90),
                                      child: Text(
                                        'لاگین کنید',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                );
                            } //waiting display
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, bottom: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ElevatedButton(
                                  onPressed: () => {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainPage(
                                          drawerTitle: widget.drawerTitle,
                                          title: widget.title,
                                          localStorageMobile:
                                              widget.localStorageMobile,
                                          localStorageWeb:
                                              widget.localStorageWeb,
                                          jwt: widget.jwt,
                                          name: widget.name,
                                        ),
                                      ),
                                    ),
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xff318d90))),
                                  //color: Color(0xff318d90),
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ],
              ),
            ), */
            Container(
              color: Color(0xffeaddd4),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 10,
                      left: 10,
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'توجه داشته باشید که نباید تنها به سیگنال‌های صادره از یک فیلتر اکتفا نمود؛ و بهتر است جهت تایید سیگنال‌ها از ابزارهای دیگر تحلیل تکنیکال و فاندامنتال استفاده نمایید.',
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () => {
                          Navigator.pushReplacement(context, widget.pgRes),
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff318d90))),
                        //color: Color(0xff318d90),
                        child: Text(
                          'واچ لیست',
                          style:
                              TextStyle(color: Color(0xffffffff), fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ],
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
