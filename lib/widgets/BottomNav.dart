import 'package:bourse_pardaz/PriceAction.dart';
import 'package:bourse_pardaz/Tablokhani.dart';
import 'package:bourse_pardaz/Systems.dart';
import 'package:flutter/material.dart';
import 'package:bourse_pardaz/Indicators.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'dart:async';

//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class BottomNav extends StatefulWidget {
  final String title;
  final String drawerTitle;
  final int navActive;
  /* final FlutterSecureStorage localStorageMobile;
  final Future<SharedPreferences> localStorageWeb;
  final String jwt; */
  final String name;
  const BottomNav(
      {Key? key,
      required this.title,
      required this.drawerTitle,
      required this.navActive,
      /* required this.localStorageMobile,
      required this.localStorageWeb,
      required this.jwt, */
      required this.name,})
      : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  //var _bottomNavIndex = 0;

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
    var _bottomNavIndex = widget.navActive; //default index of first screen

    return AnimatedBottomNavigationBar.builder(
      itemCount: iconList.length,
      activeIndex: _bottomNavIndex,
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? Color(0xffeaddd4) : Color(0xffffffff);
        String tabTitle = "";
        late MaterialPageRoute pg;
        switch (index) {
          case 0:
            {
              tabTitle = 'اندیکاتورها';
              pg = MaterialPageRoute(
                builder: (context) => Indicators(
                  title: widget.title,
                  drawerTitle: widget.drawerTitle,
                  /* localStorageMobile: widget.localStorageMobile,
                  localStorageWeb: widget.localStorageWeb,
                  jwt: widget.jwt, */
                  name: widget.name,
                ),
              );
            }
            break;
          case 1:
            {
              tabTitle = 'پرایس‌اکشن';
              pg = MaterialPageRoute(
                builder: (context) => PriceAction(
                  title: widget.title,
                  drawerTitle: widget.drawerTitle,
                  /* localStorageMobile: widget.localStorageMobile,
                  localStorageWeb: widget.localStorageWeb,
                  jwt: widget.jwt, */
                  name: widget.name,
                ),
              );
            }
            break;
          case 2:
            {
              tabTitle = 'تابلو‌خوانی';
              pg = MaterialPageRoute(
                builder: (context) => Tablokhani(
                  title: widget.title,
                  drawerTitle: widget.drawerTitle,
                  /* localStorageMobile: widget.localStorageMobile,
                  localStorageWeb: widget.localStorageWeb,
                  jwt: widget.jwt, */
                  name: widget.name,
                ),
              );
            }
            break;
          case 3:
            {
              tabTitle = '‌استراتژی‌ها';
              pg = MaterialPageRoute(
                builder: (context) => Systems(
                  title: widget.title,
                  drawerTitle: widget.drawerTitle,
                  /* localStorageMobile: widget.localStorageMobile,
                  localStorageWeb: widget.localStorageWeb,
                  jwt: widget.jwt, */
                  name: widget.name,
                ),
              );
            }
            break;
        }
        return InkWell(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AutoSizeText(
                  tabTitle,
                  maxLines: 1,
                  style: TextStyle(color: color, fontSize: 10),
                  group: autoSizeGroup,
                ),
              )
            ],
          ),
          onTap: () {
            Navigator.push(context, pg);
          },
        );
      },
      backgroundColor: Color(0xff085479),
      splashColor: Color(0xffFFA400),
      notchAndCornersAnimation: animation,
      splashSpeedInMilliseconds: 300,
      notchSmoothness: NotchSmoothness.defaultEdge,
      gapLocation: GapLocation.center,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) => setState(() => _bottomNavIndex = index),
    );
  }
}
