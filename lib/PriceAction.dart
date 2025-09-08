import 'package:bourse_pardaz/DescriptionActionPrice.dart';
import 'package:bourse_pardaz/MainPage.dart';
import 'package:bourse_pardaz/Result/priceAction/BullishEngulfingResult.dart';
import 'package:bourse_pardaz/Result/priceAction/BullishHaramiResult.dart';
import 'package:bourse_pardaz/Result/priceAction/HammerResult.dart';
import 'package:bourse_pardaz/Result/priceAction/GapResult.dart';
import 'package:bourse_pardaz/Result/priceAction/InvertedHammerResult.dart';
import 'package:bourse_pardaz/Result/priceAction/MorningStarResult.dart';
import 'package:bourse_pardaz/Result/priceAction/PiercingLineResult.dart';
import 'package:bourse_pardaz/Result/priceAction/ThreeInsideUpResult.dart';
import 'package:bourse_pardaz/Result/priceAction/ThreeOutsideUpResult.dart';
import 'package:bourse_pardaz/Result/priceAction/ThreeWhiteSoldiersResult.dart';
import 'package:bourse_pardaz/Result/priceAction/TweezersBottomsResult.dart';
import 'package:bourse_pardaz/Result/priceAction/YoSenResult.dart';
import 'package:bourse_pardaz/widgets/BottomNav.dart';
import 'package:bourse_pardaz/widgets/FloatingBottomNav.dart';
import 'package:bourse_pardaz/widgets/MainDrawer.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class PriceAction extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt; */
  final String name;
  PriceAction(
      {Key? key,
      required this.title,
      required this.drawerTitle,
      /* required this.localStorageMobile,
      required this.localStorageWeb,
      required this.jwt, */
      required this.name})
      : super(key: key);

  @override
  _PriceActionState createState() => _PriceActionState();
}

class _PriceActionState extends State<PriceAction> {
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
          navActive: 1,
          /* localStorageMobile: widget.localStorageMobile,
          localStorageWeb: widget.localStorageWeb,
          jwt: widget.jwt, */
          name: widget.name,
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
  String patternTitle = "";
  String pattern = "";
  MaterialPageRoute pg;
  MaterialPageRoute pgMain;
  switch (i) {
    case 0:
      {
        img = 'hammer.png';
        patternTitle = 'الگوی چکش';
        pattern = "Hammer";
        pgMain = MaterialPageRoute(
          builder: (context) => HammerResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionActionPrice(
            drawerTitle: drawerTitle,
            title: title,
            pattern: pattern,
            patternTitle: patternTitle,
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
        img = 'invertedHammer.png';
        patternTitle = 'الگوی چکش وارونه';
        pattern = "Inverted Hammer";
        pgMain = MaterialPageRoute(
          builder: (context) => InvertedHammerResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionActionPrice(
            drawerTitle: drawerTitle,
            title: title,
            pattern: pattern,
            patternTitle: patternTitle,
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
        img = 'gap.png';
        patternTitle = 'الگوی شکاف قیمت';
        pattern = "Gap";
        pgMain = MaterialPageRoute(
          builder: (context) => GapResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionActionPrice(
            drawerTitle: drawerTitle,
            title: title,
            pattern: pattern,
            patternTitle: patternTitle,
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
        img = 'yoSen.png';
        patternTitle = 'کندل سفید';
        pattern = 'Yo-Sen';
        pgMain = MaterialPageRoute(
          builder: (context) => YoSenResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionActionPrice(
            drawerTitle: drawerTitle,
            title: title,
            pattern: pattern,
            patternTitle: patternTitle,
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
        img = 'bullishEngulfing.png';
        patternTitle = ' پوشای صعودی';
        pattern = 'Bullish Engulfing';
        pgMain = MaterialPageRoute(
          builder: (context) => BullishEngulfingResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionActionPrice(
            drawerTitle: drawerTitle,
            title: title,
            pattern: pattern,
            patternTitle: patternTitle,
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
        img = 'threeOutsideUp.png';
        patternTitle = 'سه‌شمع‌بیرونی';
        pattern = 'Three Outside Up';
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
          builder: (context) => DescriptionActionPrice(
            drawerTitle: drawerTitle,
            title: title,
            pattern: pattern,
            patternTitle: patternTitle,
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
        img = 'piercingLine.png';
        patternTitle = 'الگوی خط نافذ';
        pattern = "Piercing Line";
        pgMain = MaterialPageRoute(
          builder: (context) => PiercingLineResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionActionPrice(
            drawerTitle: drawerTitle,
            title: title,
            pattern: pattern,
            patternTitle: patternTitle,
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
        img = 'bullishHarami.png';
        patternTitle = 'هارامی صعودی';
        pattern = 'Bullish Harami';
        pgMain = MaterialPageRoute(
          builder: (context) => BullishHaramiResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionActionPrice(
            drawerTitle: drawerTitle,
            title: title,
            pattern: pattern,
            patternTitle: patternTitle,
            pgRes: pgMain,
           /*  localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
      }
      break;

    case 8:
      {
        img = 'threeInsideUp.png';
        patternTitle = 'سه‌شمع‌درونی';
        pattern = 'Three Inside Up';
        pgMain = MaterialPageRoute(
          builder: (context) => ThreeInsideUpResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionActionPrice(
            drawerTitle: drawerTitle,
            title: title,
            pattern: pattern,
            patternTitle: patternTitle,
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
        img = 'tweezersBottoms.png';
        patternTitle = 'الگوی انبرک کف';
        pattern = 'Tweezers Bottoms';
        pgMain = MaterialPageRoute(
          builder: (context) => TweezersBottomsResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionActionPrice(
            drawerTitle: drawerTitle,
            title: title,
            pattern: pattern,
            patternTitle: patternTitle,
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
        img = 'morningStar.png';
        patternTitle = 'ستاره صبحگاهی';
        pattern = 'Morning Star';
        pgMain = MaterialPageRoute(
          builder: (context) => MorningStarResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionActionPrice(
            drawerTitle: drawerTitle,
            title: title,
            pattern: pattern,
            patternTitle: patternTitle,
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
        img = 'threeWhiteSoldiers.png';
        patternTitle = 'سه‌سربازسفید‌پوش';
        pattern = 'Three White Soldiers';
        pgMain = MaterialPageRoute(
          builder: (context) => ThreeWhiteSoldiersResult(
            drawerTitle: drawerTitle,
            title: title,
            /* localStorageMobile: localStorageMobile,
            localStorageWeb: localStorageWeb,
            jwt: jwt, */
            name: name,
          ),
        );
        pg = MaterialPageRoute(
          builder: (context) => DescriptionActionPrice(
            drawerTitle: drawerTitle,
            title: title,
            pattern: pattern,
            patternTitle: patternTitle,
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
        img = 'threeOutsideUp.png';
        patternTitle = 'سه شمع بیرونی صعودی';
        pattern = 'Three Outside Up';
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
          builder: (context) => DescriptionActionPrice(
            drawerTitle: drawerTitle,
            title: title,
            pattern: pattern,
            patternTitle: patternTitle,
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
            child: Image(image: AssetImage('assets/images/priceAction/' + img)),
          ),
          Divider(
            height: 4,
            color: Color(0xffeaddd4),
          ),
          Text(
            patternTitle,
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(context, pg);
      },
    ),
  );
}
