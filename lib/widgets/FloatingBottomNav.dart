import 'package:bourse_pardaz/MainPage.dart';
import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class FloatingBottomNav extends StatefulWidget {
  final String title;
  final String drawerTitle;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt; */
  final String name;
  const FloatingBottomNav(
      {Key? key,
      required this.title,
      required this.drawerTitle,
      /* required this.localStorageMobile,
      required this.localStorageWeb,
      required this.jwt, */
      required this.name})
      : super(key: key);

  @override
  _FloatingBottomNavState createState() => _FloatingBottomNavState();
}

class _FloatingBottomNavState extends State<FloatingBottomNav>
    with TickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  //var _FloatingBottomNavIndex = 0;

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.multiline_chart,
    Icons.swap_vert,
    Icons.view_comfy,
    Icons.stream,
  ];

  @override
  void initState() {
    super.initState();
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Color(0xff373A36),
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: FloatingActionButton(
        elevation: 8,
        backgroundColor: Color(0xff318d90),
        child: InkWell(
          child: Icon(
            Icons.home,
            color: Colors.white,
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
        onPressed: () {
          _animationController.reset();
          _animationController.forward();
        },
      ),
    );
  }
}
