/*import 'package:bourse_pardaz/DebitCardInfo.dart';
import 'package:bourse_pardaz/MainPage.dart';
import 'package:bourse_pardaz/widgets/MainDrawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:bourse_pardaz/widgets/JwtChecker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

Future<List<String>> fetchUserInfoMobile(
    FlutterSecureStorage localStorageMobile,
    http.Client client,
    var context) async {
  // ignore: unused_local_variable
  final jwtKey = await localStorageMobile.read(key: 'jwt');
  final firstKey = await localStorageMobile.read(key: 'first');
  final lastKey = await localStorageMobile.read(key: 'last');
  final emailKey = await localStorageMobile.read(key: 'email');
  final mobileKey = await localStorageMobile.read(key: 'mobile');
  final registerKey = await localStorageMobile.read(key: 'register');
  final subscriptionKey = await localStorageMobile.read(key: 'subscription');

  return [
    firstKey!,
    lastKey!,
    emailKey!,
    mobileKey!,
    registerKey!,
    subscriptionKey!
  ];
}

Future<List<String>> fetchUserInfoWeb(http.Client client, var context) async {
  SharedPreferences localStorageWeb = await SharedPreferences.getInstance();
  // ignore: unused_local_variable
  final jwtKey = await localStorageWeb.getString('jwt');
  final firstKey = await localStorageWeb.getString('first');
  final lastKey = await localStorageWeb.getString('last');
  final emailKey = await localStorageWeb.getString('email');
  final mobileKey = await localStorageWeb.getString('mobile');
  final registerKey = await localStorageWeb.getString('register');
  final subscriptionKey = await localStorageWeb.getString('subscription');

  return [
    firstKey!,
    lastKey!,
    emailKey!,
    mobileKey!,
    registerKey!,
    subscriptionKey!
  ];
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
}

class UserInfo extends StatefulWidget {
  final String title;
  final String drawerTitle;
  final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt;
  final String name;
  UserInfo(
      {Key? key,
      required this.title,
      required this.drawerTitle,
      required this.localStorageMobile,
      required this.localStorageWeb,
      required this.jwt,
      required this.name})
      : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                )
              ],
            ),
            !kIsWeb //mobileS
                ? FutureBuilder(
                    future: fetchUserInfoMobile(
                        widget.localStorageMobile, http.Client(), context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError)
                        return Text('مشکل در برقراری ارتباط با سرور');

                      return snapshot.hasData
                          ? GenerateCard(
                              items: snapshot.data as List<String>,
                              title: widget.title,
                              drawerTitle: widget.drawerTitle,
                              localStorageMobile: widget.localStorageMobile,
                              localStorageWeb: widget.localStorageWeb,
                              jwt: widget.jwt,
                              name: widget.name,
                            )
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
                  )
                : FutureBuilder(
                    //web
                    future: fetchUserInfoWeb(http.Client(), context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError)
                        return Text('مشکل در برقراری ارتباط با سرور');

                      return snapshot.hasData
                          ? GenerateCard(
                              items: snapshot.data as List<String>,
                              title: widget.title,
                              drawerTitle: widget.drawerTitle,
                              localStorageMobile: widget.localStorageMobile,
                              localStorageWeb: widget.localStorageWeb,
                              jwt: widget.jwt,
                              name: widget.name,
                            )
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'در صورت مشاهده مغایرت در مشخصات خود، موارد را از طریق ایمیل یا واتزآپ اطلاع دهید تا نسبت به ویرایش آن اقدام گردد.',
                style: TextStyle(),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'در صورتی که نیاز به تغییر رمز عبور خود داشتید، از طریق فرم "ورود به برنامه"، مراحل "فراموشی رمز عبور" را دنبال کنید.',
                style: TextStyle(),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
            InkWell(
              child: Image(
                height: 150,
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

class GenerateCard extends StatelessWidget {
  final List<String> items;
  final String title;
  final String drawerTitle;
  final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt;
  final String name;

  GenerateCard(
      {Key? key,
      required this.items,
      required this.title,
      required this.drawerTitle,
      required this.localStorageMobile,
      required this.localStorageWeb,
      required this.jwt,
      required this.name})
      : super(key: key);

  Widget build(BuildContext context) {
    if (items.length > 0)
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(5),
            2: FlexColumnWidth(2),
          },
          border: TableBorder.all(color: Colors.black, style: BorderStyle.none),
          children: [
            TableRow(children: [
              Text(
                'نام:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Center(child: Text(items[0])),
              Text(''),
            ]),
            TableRow(children: [
              Text(
                'نام خانوادگی:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Center(child: Text(items[1])),
              Text(''),
            ]),
            TableRow(children: [
              Text(
                'ایمیل:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Center(child: Text(items[2])),
              Text(''),
            ]),
            TableRow(children: [
              Text(
                'موبایل:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Center(
                child: Text(
                  NumberUtility.changeDigit((items[3]), NumStrLanguage.Farsi),
                ),
              ),
              Text(''),
            ]),
            TableRow(children: [
              Text(
                'تاریخ ثبت نام:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Center(
                child: Text(
                  DateTime.parse(
                    ((items[4].substring(
                      0,
                      items[4].indexOf(' '),
                    )).replaceAll('.', '-')),
                  ).toPersianDate(twoDigits: true),
                ),
              ),
              Text(''),
            ]),
            DateTime.now().isBefore(DateTime.parse(items[5]))
                ? TableRow(children: [
                    Text(
                      'انقضای اشتراک:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Center(
                      child: Text(
                          DateTime.parse(
                            ((items[5].substring(
                              0,
                              items[5].indexOf(' '),
                            )).replaceAll('.', '-')),
                          ).toPersianDate(twoDigits: true),
                          style: TextStyle(color: Colors.green)),
                    ),
                    Text(
                      (NumberUtility.changeDigit(
                              ((DateTime.now()
                                          .difference(DateTime.parse(items[5]))
                                          .inDays) *
                                      (-1))
                                  .toString(),
                              NumStrLanguage.Farsi) +
                          ' ' +
                          'روز'),
                      style: TextStyle(color: Colors.green),
                    ),
                  ])
                : TableRow(children: [
                    Text(
                      'انقضای اشتراک:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Center(
                      child: Text(
                          DateTime.parse(
                            ((items[5].substring(
                              0,
                              items[5].indexOf(' '),
                            )).replaceAll('.', '-')),
                          ).toPersianDate(twoDigits: true),
                          style: TextStyle(color: Colors.red)),
                    ),
                    InkWell(
                      child: Text(
                        "خرید اشتراک",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff318d90),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DebitCardInfo(
                              title: title,
                              drawerTitle: drawerTitle,
                              /* localStorageMobile: localStorageMobile,
                              localStorageWeb: localStorageWeb,
                              jwt: jwt, */
                              name: name,
                            ),
                          ),
                        );
                      },
                    )
                  ]),
          ],
        ),
      );
    else {
      return Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Center(
          child: Container(
            color: Color(0xffeaddd4),
            child: Text('اطلاعات یافت نشد.'),
          ),
        ),
      );
    }
  }
}
*/