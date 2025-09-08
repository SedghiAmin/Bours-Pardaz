import 'package:flutter/material.dart';

class BR extends StatelessWidget {
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
              'این استراتژی از ترکیب دو تایم فریم روزانه و 1 ساعته استفاده میکند. اسیلاتور RSI را در تایم فریم روزانه و برای تشخیص جهت روند بررسی میکنیم. اگر خط RSI بالاتر از شاخص 50 و رو به بالا باشد، جهت روند را صعودی در نظر میگیریم. اندیکاتور بولینگر رو در تایم فریم 1 ساعته مورد استفاده قرار میدهیم و در صورتی وارد معامله خرید میشویم که شرایط زیر برقرار باشد: \n' +
                  '1- خطRSI در تایم فریم روزانه بالای 50 باشدو جهت صعودی داشته باشد. \n' +
                  '2- قیمت close کندل در تایم فریم 1 ساعته، بالای خط پایینی باند بولینگر شکل بگیرد. \n',
              style: TextStyle(color: Colors.black),
              textDirection: TextDirection.rtl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image:
                    AssetImage('assets/images/strategies/charts/BRchart.png'),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'سیگنال خروج از معامله زمانی صادر میشود که در تایم فریم 1 ساعته، قیمت close دو کندل پیاپی در بالای خط بالایی باند بولینگر تشکیل شود. \n' +
                  'حد ضرر را هم روی نقطه low کندلی که در بالای خط پایینی باند بولینگر بسته شد قرار میدهیم. \n\n' +
                  'مجددا تاکید میکنم که در این استراتژی باند بولینگر را در تایم فریم یک ساعته و اسیلاتور RSI را در تایم فریم روزانه بررسی میکنیم، و نتیحه این دو را با هم ترکیب میکنیم.',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
