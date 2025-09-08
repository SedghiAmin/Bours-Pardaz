import 'package:bourse_pardaz/AcMainPage.dart';
import 'package:bourse_pardaz/AdxMainPage.dart';
import 'package:bourse_pardaz/BearMainPage.dart';
import 'package:bourse_pardaz/BollingerMainPage.dart';
import 'package:bourse_pardaz/Description.dart';
import 'package:bourse_pardaz/IchimokuMainPage.dart';
import 'package:bourse_pardaz/MacdMainPage.dart';
import 'package:bourse_pardaz/MainPage.dart';
import 'package:bourse_pardaz/MfiMainPage.dart';
import 'package:bourse_pardaz/RsiMainPage.dart';
import 'package:bourse_pardaz/SarMainPage.dart';
import 'package:bourse_pardaz/CciMainPage.dart';
import 'package:bourse_pardaz/StochasticMainPage.dart';
import 'package:bourse_pardaz/WprMainPage.dart';
import 'package:bourse_pardaz/widgets/BottomNav.dart';
import 'package:bourse_pardaz/widgets/FloatingBottomNav.dart';
//import 'package:bourse_pardaz/UnderConstruction.dart';
import 'package:bourse_pardaz/widgets/MainDrawer.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class Indicators extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt; */
  final String name;
  Indicators(
      {Key? key,
      required this.title,
      required this.drawerTitle,
      /* required this.localStorageMobile,
      required this.localStorageWeb,
      required this.jwt, */
      required this.name})
      : super(key: key);

  @override
  _IndicatorsState createState() => _IndicatorsState();
}

class _IndicatorsState extends State<Indicators> {
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: OrientationBuilder(
                  builder: (context, orientation) {
                    return GridView.count(
                      crossAxisCount: orientation == Orientation.portrait
                          ? 3
                          : (MediaQuery.of(context).size.width ~/ 120).toInt(),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(
                          12,
                          (index) => generateCard(
                              index,
                              widget.title,
                              widget.drawerTitle,
                              /* widget.localStorageMobile,
                              widget.localStorageWeb,
                              widget.jwt, */
                              widget.name,
                              context)),
                    );
                  },
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
    );
  }
}

Card generateCard(
    int i,
    String title,
    String drawerTitle,
    /* FlutterSecureStorage localStorageMobile,
    Future<SharedPreferences> localStorageWeb,
    String jwt, */
    String name,
    context) {
  String img = "";
  String indicatorTitle = "";
  String indicator = "";
  String setting = "";
  MaterialPageRoute pg;
  MaterialPageRoute pgMain;
  switch (i) {
    case 0:
      {
        img = 'macd.png';
        indicatorTitle = 'اسیلاتور MACD';
        setting = 'MACD(12,26,9)';
        indicator = "MACD";
        pgMain = MaterialPageRoute(
          builder: (context) => MacdMainPage(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => Description(
            drawerTitle: drawerTitle,
            title: title,
            indicator: indicator,
            indicatorTitle: indicatorTitle,
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
        img = 'rsi.png';
        indicatorTitle = 'اسیلاتور RSI';
        setting = 'RSI(14)';
        indicator = "RSI";
        pgMain = MaterialPageRoute(
          builder: (context) => RsiMainPage(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => Description(
            drawerTitle: drawerTitle,
            title: title,
            indicator: indicator,
            indicatorTitle: indicatorTitle,
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
        img = 'cci.png';
        indicatorTitle = 'اسیلاتور CCI';
        setting = 'CCI(20)';
        indicator = "CCI";
        pgMain = MaterialPageRoute(
          builder: (context) => CciMainPage(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => Description(
            drawerTitle: drawerTitle,
            title: title,
            indicator: indicator,
            indicatorTitle: indicatorTitle,
            pgRes: pgMain,
           /*  localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;
    case 3:
      {
        img = 'adx.png';
        indicatorTitle = 'اسیلاتور ADX';
        setting = 'ADX(14)';
        indicator = 'ADX';
        pgMain = MaterialPageRoute(
          builder: (context) => AdxMainPage(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => Description(
            drawerTitle: drawerTitle,
            title: title,
            indicator: indicator,
            indicatorTitle: indicatorTitle,
            pgRes: pgMain,
           /*  localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;
    case 4:
      {
        img = 'mfi.png';
        indicatorTitle = 'اسیلاتور MFI';
        setting = 'MFI(14)';
        indicator = 'MFI';
        pgMain = MaterialPageRoute(
          builder: (context) => MfiMainPage(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => Description(
            drawerTitle: drawerTitle,
            title: title,
            indicator: indicator,
            indicatorTitle: indicatorTitle,
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
        img = 'ichimoku.png';
        indicatorTitle = 'اسیلاتور Ichimoku';
        setting = 'Ichimoku(9,26,52)';
        indicator = 'Ichimoku';
        pgMain = MaterialPageRoute(
          builder: (context) => IchimokuMainPage(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => Description(
            drawerTitle: drawerTitle,
            title: title,
            indicator: indicator,
            indicatorTitle: indicatorTitle,
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
        img = 'sar.png';
        indicatorTitle = 'اندیکاتور SAR';
        setting = 'SAR(0.02,0.2)';
        indicator = 'SAR';
        pgMain = MaterialPageRoute(
          builder: (context) => SarMainPage(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => Description(
            drawerTitle: drawerTitle,
            title: title,
            indicator: indicator,
            indicatorTitle: indicatorTitle,
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
        img = 'stochastic.png';
        indicatorTitle = 'اسیلاتور Stochastic';
        setting = 'Stochastic(5,3,3)';
        indicator = 'Stochastic';
        pgMain = MaterialPageRoute(
          builder: (context) => StochasticMainPage(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => Description(
            drawerTitle: drawerTitle,
            title: title,
            indicator: indicator,
            indicatorTitle: indicatorTitle,
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
        img = 'ac.png';
        indicatorTitle = 'اسیلاتور AC';
        setting = 'AC()';
        indicator = 'AC';
        pgMain = MaterialPageRoute(
          builder: (context) => AcMainPage(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => Description(
            drawerTitle: drawerTitle,
            title: title,
            indicator: indicator,
            indicatorTitle: indicatorTitle,
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
        img = 'bear.png';
        indicatorTitle = 'اندیکاتور Bears Power';
        setting = 'BearPower(13)';
        indicator = 'BearPower';
        pgMain = MaterialPageRoute(
          builder: (context) => BearMainPage(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => Description(
            drawerTitle: drawerTitle,
            title: title,
            indicator: indicator,
            indicatorTitle: indicatorTitle,
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
        img = 'bollinger.png';
        indicatorTitle = 'اندیکاتور Bollinger Bands';
        setting = 'Bollinger(20)';
        indicator = 'Bollinger';
        pgMain = MaterialPageRoute(
          builder: (context) => BollingerMainPage(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => Description(
            drawerTitle: drawerTitle,
            title: title,
            indicator: indicator,
            indicatorTitle: indicatorTitle,
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
        img = 'wpr.png';
        indicatorTitle = 'اسیلاتور WPR';
        setting = 'WPR(14)';
        indicator = 'WPR';
        pgMain = MaterialPageRoute(
          builder: (context) => WprMainPage(
            drawerTitle: drawerTitle,
            title: title,
           /*  localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => Description(
            drawerTitle: drawerTitle,
            title: title,
            indicator: indicator,
            indicatorTitle: indicatorTitle,
            pgRes: pgMain,
           /*  localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;
    default:
      {
        img = 'stochastic.png';
        indicatorTitle = 'اسیلاتور Stochastic ';
        setting = 'Stochastic(5,3,3)';
        indicator = 'stochastic';
        pgMain = MaterialPageRoute(
          builder: (context) => StochasticMainPage(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => Description(
            drawerTitle: drawerTitle,
            title: title,
            indicator: indicator,
            indicatorTitle: indicatorTitle,
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
  var grey = Colors.grey;
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          (20),
        ),
      ),
    ),
    elevation: 4,
    child: InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            color: grey[100],
            child: Image(image: AssetImage('assets/images/indicators/' + img)),
          ),
          Divider(
            height: 4,
            color: Color(0xffeaddd4),
          ),
          Text(
            setting,
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.ltr,
          ),
        ],
      ),
      onTap: () {
        Navigator.push(context, pg);
      },
    ),
  );
}
