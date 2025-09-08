import 'package:flutter/material.dart';

class RSEE extends StatelessWidget {
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
              'این یکی از قابل اعتمادترین استراتژیهای معاملاتی است. ما در اینجا این استزاتژی را در تایم فریم روزانه پیاده‌سازی مینماییم.' +
                  '\n' +
                  'در صورت برقراری تمام شرایط زیرسیگنال ورود صادر میشود:' +
                  '\n' +
                  '1- میانگین متحرک نمایی 3 روزه، میانگین متحرک نمایی 8 روزه را رو به بالا قطع کند.' +
                  '\n' +
                  '2- شاخص اسیلاتور RSI بالای 50 باشد.' +
                  '\n' +
                  '3- خطوط %K و %D در اسیلاتور استوک استیک هم رو به بالا باشد و هم در محدوده اشباع خرید و یا اشباع فروش نباشد.',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image:
                    AssetImage('assets/images/strategies/charts/RSEEchart.png'),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'در صورتی که هریک از شرایط زیر برقرار شد میتوانید از معامله خارج شوید:' +
                  '\n' +
                  '1- میانگین متحرک نمایی 3 روزه، میانگین متحرک نمایی 8 روزه را رو به پایین بشکند. در صورتی که این حرکت همراه با یک کندل نزولی نسبتا بلند هم باشد باعث افزایش اعتبار آن میشود. ' +
                  '\n' +
                  '2- شاخص اسیلاتور RSI به زیر50 نفوذ کند.',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
