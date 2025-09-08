import 'package:flutter/material.dart';

class SRS extends StatelessWidget {
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
              'این استراتژی یکی از قابل اعتمادترین سیستم‌های معاملاتی است که در تایم فریم روزانه پیاده‌سازی میکنیم. در شرایط زیر سیگنال خرید صادر میشود: \n' +
                  '1- خط SMA(144) زیر کندل‌های قیمت حرکت کند. (نشان دهنده روند صعودی) \n' +
                  '2- وقتی شاخص استوک استیک و RSI در محدوده اشباع فروش باشد. (زیر محدوده 30) \n' +
                  '3-  خط %K خط %D را در اندیکاتور استوک استیک به سمت بالا قطع کند. \n',
              style: TextStyle(color: Colors.black),
              textDirection: TextDirection.rtl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image:
                    AssetImage('assets/images/strategies/charts/SRSchart.png'),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'سیگنال خروج از معامله زمانی صادر میشود که شاخص اندیکاتور استوک استیک وارد محدوده اشباع خرید شود. ',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
