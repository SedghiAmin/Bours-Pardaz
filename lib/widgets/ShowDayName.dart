import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:persian_date/persian_date.dart';
//import 'package:jalali_calendar/jalali_calendar.dart';
//import 'package:persian_number_utility/persian_number_utility.dart';

class ShowDayName extends StatefulWidget {
  ShowDayName({Key? key, required this.dateTime}) : super(key: key);

  final DateTime dateTime;

  @override
  _ShowDayNameState createState() => _ShowDayNameState();
}

class _ShowDayNameState extends State<ShowDayName> {
  late String _timeString;
  //PersianDate persianDate = PersianDate();

  @override
  void initState() {
    _timeString = _formatDateTime(widget.dateTime);
    Timer.periodic(Duration(hours: 3), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeString,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 10),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return ""; /*NumberUtility.changeDigit(
        persianDate.gregorianToJalali(
            persianDate.year!, persianDate.month!, persianDate.day!, "DD"),
        NumStrLanguage.Farsi);*/
  }
}
