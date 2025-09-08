import 'package:bourse_pardaz/MainPage.dart';
import 'package:bourse_pardaz/widgets/MainDrawer.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class DebitCardInfo extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt; */
  final String name;
  DebitCardInfo(
      {Key? key,
      required this.title,
      required this.drawerTitle,
      /* required this.localStorageMobile,
      required this.localStorageWeb,
      required this.jwt, */
      required this.name})
      : super(key: key);

  @override
  _DebitCardInfoState createState() => _DebitCardInfoState();
}

class _DebitCardInfoState extends State<DebitCardInfo> {
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
                            /* localStorageMobile: widget.localStorageMobile,
                            localStorageWeb: widget.localStorageWeb,
                            jwt: widget.jwt, */
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
                  DataTable(
                    columns: [
                      DataColumn(
                          label: Text('مدت',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'تخفیف',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'قیمت (تومان)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('15 روزه',
                            style:
                                TextStyle(backgroundColor: Color(0xffeaddd4)))),
                        DataCell(Container(
                          child: Text('-'),
                          alignment: Alignment.center,
                        )),
                        DataCell(Container(
                          child: Text(
                            '55,000',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff085479)),
                          ),
                          alignment: Alignment.center,
                        )),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('30 روزه',
                            style:
                                TextStyle(backgroundColor: Color(0xffeaddd4)))),
                        DataCell(Container(
                          child: Text('10%'),
                          alignment: Alignment.center,
                        )),
                        DataCell(Container(
                          child: Text(
                            '99,000',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff085479)),
                          ),
                          alignment: Alignment.center,
                        )),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('60 روزه',
                            style:
                                TextStyle(backgroundColor: Color(0xffeaddd4)))),
                        DataCell(Container(
                          child: Text('12%'),
                          alignment: Alignment.center,
                        )),
                        DataCell(Container(
                          child: Text(
                            '194,000',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff085479)),
                          ),
                          alignment: Alignment.center,
                        )),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('90 روزه',
                            style:
                                TextStyle(backgroundColor: Color(0xffeaddd4)))),
                        DataCell(Container(
                          child: Text('15%'),
                          alignment: Alignment.center,
                        )),
                        DataCell(Container(
                          child: Text(
                            '280,000',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff085479)),
                          ),
                          alignment: Alignment.center,
                        )),
                      ]),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 10),
                      child: Text(
                        'لطفا مبلغ اشتراک خود را با یکی از روشهای زیر به حساب' +
                            '\n' +
                            'امین صدقی در بانک صادرات واریز نمایید:' +
                            '\n\n' +
                            'شماره کارت: ' +
                            '6037691676762503' +
                            '\n' +
                            'شماره حساب: ' +
                            '0106852098007' +
                            '\n' +
                            'شماره شبا: ' +
                            'IR 92 019 0000000106852098007',
                        style: TextStyle(),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 10),
                      child: Text(
                        'رسید واریز وجه را از طریق واتزآپ ارسال کنید.' +
                            '\n' +
                            'اشتراک شما حداکثر تا 2 ساعت کاری بعد فعال خواهد شد.',
                        style: TextStyle(),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Image(
                      height: 100,
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
