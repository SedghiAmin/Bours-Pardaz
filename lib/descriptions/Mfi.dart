import 'package:flutter/material.dart';

class Mfi extends StatelessWidget {
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
              'مخفف عبارت Money Flow Index' +
                  '\n' +
                  'به معنای شاخص گردش نقدینگی میباشد.' +
                  '\n' +
                  'MFI با استفاده از قیمت و حجم معاملات، میزان فشار در سمت خریدار / فروشنده را محاسبه میکند. وقتی MFI صعودی میشود نشان دهنده افزایش قدرت خریدار و زمانی که این شاخص نزولی میشود نشان از افزایش قدرت در سمت خریدار است.  ',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image:
                    AssetImage('assets/images/indicators/charts/mfiChart.png'),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'زمانی که MFI به بالای خط 80 برسد نشان دهنده اشباع خرید در آن سهام است و دقیقا برعکس زمانی که به زیر خط 20 برسد نشان از اشباع فروش میباشد.' +
                  '\n' +
                  'این اندیکاتور در هنگام تغییر روند میتواند کمک بسیار خوبی برای تاییدیه گرفتن انجام دهد .' +
                  '\n' +
                  'از دیگر کاربردهای MFI تشخیص واگرایی‌ها در نمودار است.' +
                  '\n' +
                  'سعی کنید زمانی که اندیکاتور MFI در محدوده ۴۰ تا ۵۰ است به هیچ عنوان معامله ای نکنید به این دلیل که در آن محدوده اندیکاتور هیچ نظر خاصی در مورد بازار ندارد و نشان از رنج بودن بازار است.' +
                  '\n' +
                  'بهتر است برای دریافت سیگنال‌های معتبر از یک اندیکاتور مومنتوم مثل RSI در کنار MFI استفاده کنید.',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
