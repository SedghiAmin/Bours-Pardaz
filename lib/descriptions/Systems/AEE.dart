import 'package:flutter/material.dart';

class AEE extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'ما این استراتژی را در تایم فریم روزانه پیاده‌سلزی میکنیم. در این استراتژی از اندیکاتور ADX برای تایید کراس‌هایی که در موینگ اوریج ها بوجود میآید، استفاده میکنیم. در صورت برقراری شرایط زیر سیگنال خرید صادر میشود: \n' +
                  '1- میانگین متحرک نمایی 3 روزه از پایین میانگین متحرک نمایی 8 روزه را رو به بالا بشکند { EMA(3) > EMA(8) }. \n' +
                  '2- خط DI+ بالای DI- منفی باشد. \n' +
                  '3- شاخص ADX بالای 25 باشد. (بالای 30 باشد بهتر است) \n' +
                  '4- جهت حرکت شاخص ADX رو به بالا باشد.',
              style: TextStyle(color: Colors.black),
              textDirection: TextDirection.rtl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image:
                    AssetImage('assets/images/strategies/charts/AEEchart.png'),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'سیگنال خروج از معامله زمانی صادر میشود که خط EMA(3) خط EMA(8) را رو به پایین بشکند.',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
