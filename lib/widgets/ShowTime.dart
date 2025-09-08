import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:jalali_calendar/jalali_calendar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ShowTime extends StatefulWidget {
  ShowTime({Key? key, required this.dateTime}) : super(key: key);

  final DateTime dateTime;

  @override
  _ShowTimeState createState() => _ShowTimeState();
}

class _ShowTimeState extends State<ShowTime> {
  late String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(widget.dateTime);
    Timer.periodic(Duration(hours: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeString,
      textAlign: TextAlign.left,
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
    return NumberUtility.changeDigit(
            dateTime.hour.toString(), NumStrLanguage.Farsi) +
        ':' +
        NumberUtility.changeDigit(
            dateTime.minute.toString(), NumStrLanguage.Farsi);
    /*+
        ':' +
        NumberUtility.changeDigit(
            persianDate.gregorianToJalali(dateTime.toString(), "ss"),
            NumStrLanguage.Farsi);*/
  }
}
