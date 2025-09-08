import 'package:flutter/material.dart';

class AM extends StatelessWidget {
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
              'ما این استراتژی را در تایم فریم روزانه پیاده‌سازی میکنیم. از اندیکاتور ADX برای تایید کراس‌هایی که در اندیکاتور MACD رخ میدهد استفاده میکنیم. در صورت برقراری شرایط زیر وارد معامله خرید میشویم:\n' +
                  '1- در اندیکانور MACD خط main خط signal را رو به بالا بشکند. \n' +
                  '2- خط main در اندیکاتور MACD بالای صفر باشد \n' +
                  '3- خط DI+ بالای خط DI- باشد \n' +
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
                    AssetImage('assets/images/strategies/charts/AMchart.png'),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'در صورتی که مقدار ADX بالاتر از 25 باشد اعتبار سیگنال‌های صادر شده بیشت میشود. \n',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
