import 'package:bourse_pardaz/DescriptionSystems.dart';
import 'package:bourse_pardaz/MainPage.dart';
import 'package:bourse_pardaz/Result/Systems/AMresult.dart';
import 'package:bourse_pardaz/Result/Systems/BRresult.dart';
import 'package:bourse_pardaz/Result/Systems/REEresult.dart';
import 'package:bourse_pardaz/Result/Systems/RSEEresult.dart';
import 'package:bourse_pardaz/Result/Systems/AEEresult.dart';
import 'package:bourse_pardaz/Result/Systems/SEEresult.dart';
import 'package:bourse_pardaz/Result/Systems/MESresult.dart';
import 'package:bourse_pardaz/Result/Systems/SRSresult.dart';
import 'package:bourse_pardaz/Result/priceAction/ThreeOutsideUpResult.dart';
import 'package:bourse_pardaz/UnderConstruction.dart';
import 'package:bourse_pardaz/widgets/BottomNav.dart';
import 'package:bourse_pardaz/widgets/FloatingBottomNav.dart';
import 'package:bourse_pardaz/widgets/MainDrawer.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class Systems extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt; */
  final String name;

  Systems(
      {Key? key,
      required this.title,
      required this.drawerTitle,
     /*  required this.localStorageMobile,
      required this.localStorageWeb,
      required this.jwt, */
      required this.name})
      : super(key: key);

  @override
  _SystemsState createState() => _SystemsState();
}

class _SystemsState extends State<Systems> {
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
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return generateCard(
                        index,
                        widget.title,
                        widget.drawerTitle,
                        /* widget.localStorageMobile,
                        widget.localStorageWeb,
                        widget.jwt, */
                        widget.name,
                        context);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
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
          navActive: 3,
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
        filterTitle = 'Stochastic(5,3,3) + EMA(2) + EMA(5)';
        description = "";
        filter = 'SEE';
        pgMain = MaterialPageRoute(
          builder: (context) => SEEresult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionSystems(
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
        /*MaterialPageRoute(
          builder: (context) => DescriptionSystems(
            drawerTitle: drawerTitle,
            title: title,
            description: description,
            filter: filter,
            filterTitle: filterTitle,
            pgRes: pgMain,
          ),
        );*/
      }
      break;
    case 1:
      {
        filterTitle = 'MACD(12,26,9) + EMA(3) + SMA(8)';
        description = "";
        filter = 'MES';
        pgMain = MaterialPageRoute(
          builder: (context) => MESresult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionSystems(
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
        filterTitle = 'RSI(14) + EMA(3) + EMA(8)';
        description = '';
        filter = 'REE';
        pgMain = MaterialPageRoute(
          builder: (context) => REEresult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionSystems(
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
        filterTitle = 'RSI(14) + Stochastic(14,3,3) \n + EMA(3) + EMA(8)';
        description = '';
        filter = 'RSEE';
        pgMain = MaterialPageRoute(
          builder: (context) => RSEEresult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionSystems(
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
        filterTitle = 'ADX(14) + EMA(3) + EMA(8)';
        description = '';
        filter = 'AEE';
        pgMain = MaterialPageRoute(
          builder: (context) => AEEresult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionSystems(
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
        filterTitle = 'Stochastic(5,3,3) + RSI(14) + SMA(144)';
        description = '';
        filter = 'SRS';
        pgMain = MaterialPageRoute(
          builder: (context) => SRSresult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionSystems(
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
        filterTitle = 'Bollinger(20) + RSI(14)';
        description = '';
        filter = 'BR';
        pgMain = MaterialPageRoute(
          builder: (context) => BRresult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionSystems(
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
        filterTitle = 'ADX(14) + MACD(12,26,9)';
        description = '';
        filter = 'AM';
        pgMain = MaterialPageRoute(
          builder: (context) => AMresult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionSystems(
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
        filterTitle = 'صف خرید';
        description = 'Three Outside Up';
        pgMain = MaterialPageRoute(
          builder: (context) => ThreeOutsideUpResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => UnderConstruction(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
            // description: description,
            // filter: filter,
            //filterTitle: filterTitle,
            // pgRes: pgMain,
          ),
        );
      }
      break;
  }

  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Container(
      margin: new EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 60,
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
                height: 60,
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
                    textAlign: TextAlign.center,
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
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
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
