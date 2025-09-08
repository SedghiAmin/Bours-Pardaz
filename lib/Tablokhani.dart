import 'package:bourse_pardaz/DescriptionTablokhani.dart';
import 'package:bourse_pardaz/MainPage.dart';
import 'package:bourse_pardaz/Result/Tablokhani/EnterMoneyResult.dart';
import 'package:bourse_pardaz/Result/Tablokhani/ExitMoneyResult.dart';
import 'package:bourse_pardaz/Result/Tablokhani/FinishPositiveResult.dart';
import 'package:bourse_pardaz/Result/Tablokhani/PowerfullBuyerResult.dart';
import 'package:bourse_pardaz/Result/Tablokhani/LastPositiveResult.dart';
import 'package:bourse_pardaz/Result/Tablokhani/PowerfullSellerResult.dart';
import 'package:bourse_pardaz/Result/Tablokhani/SaatResult.dart';
import 'package:bourse_pardaz/Result/Tablokhani/SafeForoshResult.dart';
import 'package:bourse_pardaz/Result/Tablokhani/SafeKharidResult.dart';
import 'package:bourse_pardaz/Result/Tablokhani/SmartMoneyEntryResult.dart';
import 'package:bourse_pardaz/Result/Tablokhani/SmartMoneyOutflowResult.dart';
import 'package:bourse_pardaz/Result/Tablokhani/SusVolResult.dart';
import 'package:bourse_pardaz/Result/Tablokhani/TickResult.dart';
import 'package:bourse_pardaz/Result/Tablokhani/TrendeUpResult.dart';

// ignore: unused_import
import 'package:bourse_pardaz/UnderConstruction.dart';
import 'package:bourse_pardaz/widgets/BottomNav.dart';
import 'package:bourse_pardaz/widgets/FloatingBottomNav.dart';
import 'package:bourse_pardaz/widgets/MainDrawer.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class Tablokhani extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt; */
  final String name;

  Tablokhani(
      {Key? key,
      required this.title,
      required this.drawerTitle,
      /* required this.localStorageMobile,
      required this.localStorageWeb,
      required this.jwt, */
      required this.name})
      : super(key: key);

  @override
  _TablokhaniState createState() => _TablokhaniState();
}

class _TablokhaniState extends State<Tablokhani> {
  int? i;

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
            Tooltip(
              message: 'صفحه قبل',
              child: IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: () => Navigator.push(
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
                  ),
                ),
              ),
            ),
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
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     for (i = 0; i < 14; i++)
        //       generateCard(i, widget.title, widget.drawerTitle, context),
        //   ],
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ListView.builder(
                    itemCount: 14,
                    itemBuilder: (context, index) {
                      return generateCard(
                          index,
                          widget.title,
                          widget.drawerTitle,
                         /*  widget.localStorageMobile,
                          widget.localStorageWeb,
                          widget.jwt, */
                          widget.name,
                          context);
                    }),
              ),
            ),
            SizedBox(
              height: 20,
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

Widget generateCard(
    int i,
    String title,
    String drawerTitle,
    /* FlutterSecureStorage localStorageMobile,
    Future<SharedPreferences> localStorageWeb,
    String jwt, */
    String name,
    context) {
  String filterTitle = "";
  String description = "";
  String filter = "";
  MaterialPageRoute pg;
  MaterialPageRoute pgMain;
  switch (i) {
    case 0:
      {
        filterTitle = 'ورود پول حقیقی';
        description = "";
        filter = 'Enter Money';
        pgMain = MaterialPageRoute(
          builder: (context) => EnterMoneyResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionTablokhani(
            drawerTitle: drawerTitle,
            title: title,
            description: description,
            filter: filter,
            filterTitle: filterTitle,
            pgRes: pgMain,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;
    case 1:
      {
        filterTitle = 'خروج پول حقیقی';
        description = "";
        filter = 'Exit Money';
        pgMain = MaterialPageRoute(
          builder: (context) => ExitMoneyResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionTablokhani(
            drawerTitle: drawerTitle,
            title: title,
            description: description,
            filter: filter,
            filterTitle: filterTitle,
            pgRes: pgMain,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;
    case 2:
      {
        filterTitle = 'حجم مشکوک معاملات';
        description = "";
        filter = 'Suspicious Volume';
        pgMain = MaterialPageRoute(
          builder: (context) => SusVolResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionTablokhani(
            drawerTitle: drawerTitle,
            title: title,
            description: description,
            filter: filter,
            filterTitle: filterTitle,
            pgRes: pgMain,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;
    case 3:
      {
        filterTitle = 'ورود پول هوشمند';
        description = '';
        filter = 'Smart Money Entry';
        pgMain = MaterialPageRoute(
          builder: (context) => SmartMoneyEntryResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionTablokhani(
            drawerTitle: drawerTitle,
            title: title,
            description: description,
            filter: filter,
            filterTitle: filterTitle,
            pgRes: pgMain,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;
    case 4:
      {
        filterTitle = 'خروج پول هوشمند';
        description = '';
        filter = 'Smart Money Outflow';
        pgMain = MaterialPageRoute(
          builder: (context) => SmartMoneyOutflowResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionTablokhani(
            drawerTitle: drawerTitle,
            title: title,
            description: description,
            filter: filter,
            filterTitle: filterTitle,
            pgRes: pgMain,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;
    case 5:
      {
        filterTitle = 'گارد صعودی';
        description = "";
        filter = 'Trend Up';
        pgMain = MaterialPageRoute(
          builder: (context) => TrendeUpResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionTablokhani(
            drawerTitle: drawerTitle,
            title: title,
            description: description,
            filter: filter,
            filterTitle: filterTitle,
            pgRes: pgMain,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;

    case 6:
      {
        filterTitle = 'خریداران قدرتمند حقیقی';
        description = '';
        filter = 'Powerfull Buyer';
        pgMain = MaterialPageRoute(
          builder: (context) => PowerfullBuyerResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionTablokhani(
            drawerTitle: drawerTitle,
            title: title,
            description: description,
            filter: filter,
            filterTitle: filterTitle,
            pgRes: pgMain,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;
    case 7:
      {
        filterTitle = 'فروشندگان قدرتمند حقیقی';
        description = '';
        filter = 'Powerfull Seller';
        pgMain = MaterialPageRoute(
          builder: (context) => PowerfullSellerResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionTablokhani(
            drawerTitle: drawerTitle,
            title: title,
            description: description,
            filter: filter,
            filterTitle: filterTitle,
            pgRes: pgMain,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;
    case 8:
      {
        filterTitle = 'الگوی تیک';
        description = '';
        filter = 'Tick';
        pgMain = MaterialPageRoute(
          builder: (context) => TickResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionTablokhani(
            drawerTitle: drawerTitle,
            title: title,
            description: description,
            filter: filter,
            filterTitle: filterTitle,
            pgRes: pgMain,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;
    case 9:
      {
        filterTitle = 'الگوی ساعت';
        description = '';
        filter = 'Saat';
        pgMain = MaterialPageRoute(
          builder: (context) => SaatResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionTablokhani(
            drawerTitle: drawerTitle,
            title: title,
            description: description,
            filter: filter,
            filterTitle: filterTitle,
            pgRes: pgMain,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;
    case 10:
      {
        filterTitle = 'در آستانه صف خرید';
        description = '';
        filter = 'Safe Kharid';
        pgMain = MaterialPageRoute(
          builder: (context) => SafeKharidResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionTablokhani(
            drawerTitle: drawerTitle,
            title: title,
            description: description,
            filter: filter,
            filterTitle: filterTitle,
            pgRes: pgMain,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;
    case 11:
      {
        filterTitle = 'در آستانه صف فروش';
        description = '';
        filter = 'Safe Forosh';
        pgMain = MaterialPageRoute(
          builder: (context) => SafeForoshResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionTablokhani(
            drawerTitle: drawerTitle,
            title: title,
            description: description,
            filter: filter,
            filterTitle: filterTitle,
            pgRes: pgMain,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;
    case 12:
      {
        filterTitle = 'قیمت پایانی مثبت';
        description = '';
        filter = 'Finish Positive';
        pgMain = MaterialPageRoute(
          builder: (context) => FinishPositiveResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionTablokhani(
            drawerTitle: drawerTitle,
            title: title,
            description: description,
            filter: filter,
            filterTitle: filterTitle,
            pgRes: pgMain,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;

    case 13:
      {
        filterTitle = 'آخرین قیمت مثبت';
        description = '';
        filter = 'Last Positive';
        pgMain = MaterialPageRoute(
          builder: (context) => LastPositiveResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionTablokhani(
            drawerTitle: drawerTitle,
            title: title,
            description: description,
            filter: filter,
            filterTitle: filterTitle,
            pgRes: pgMain,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;

    default:
      {
        filterTitle = 'آخرین قیمت مثبت';
        description = '';
        filter = 'Last Positive';
        pgMain = MaterialPageRoute(
          builder: (context) => LastPositiveResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionTablokhani(
            drawerTitle: drawerTitle,
            title: title,
            description: description,
            filter: filter,
            filterTitle: filterTitle,
            pgRes: pgMain,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;
  }

  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Container(
      margin: new EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 50,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              (10),
            ),
          ),
        ),
        child: InkWell(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff318d90), Color(0xff318d90)],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft),
                ),
                //color: Color(0xff318d90),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    NumberUtility.changeDigit(
                        (i + 1).toString(), NumStrLanguage.Farsi),
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    filterTitle,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                width: 10,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff85c9e0), Color(0xff318d90)],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft),
                ),
                //color: Color(0xff85c9e0),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(context, pg);
          },
        ),
      ),
    ),
  );
}
