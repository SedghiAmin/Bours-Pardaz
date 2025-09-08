import 'package:flutter/material.dart';

class MES extends StatelessWidget {
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
              'این استراتژی را در تایم فریم روزانه بررسی خواهیم کرد. \n سیگنال خرید در شرایط زیر صادر میشود: \n 1- مووینگ اوریج نمایی 3 روزه از پایین مووینگ اوریج ساده 8 روزه را به سمت بالا بشکند. \n 2- خط مکدی خط سیگنال را به سمت بالا قطع کرده باشد',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image:
                    AssetImage('assets/images/strategies/charts/MESchart.png'),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'توجه داشته باشید که تقاطع خط مکدی و سیگنال ممکن است حداکثر تا سه کندل قبلی هم اتفاق افتاده باشد. اما اغلب معامله‌گران در صورتی وارد معامله میشوند که کراس بین خطوط اندیکاتور مکدی و مووینگ اوریج همزمان اتفاق بیفتد.',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Text(
            'نقطه استاپ لاست شما با توجه به استراتژی شما و نسبت ریسک به ریوارد، متغیر می‌باشد. اما متداول است که در صورتی که فاصله نقطه ورود با اولین نقطه حمایتی زیاد نباشد، میتوان آن را به عنوان نقطه استاپ لاست در نظر گرفت. همچنین در صورتی که خواهان ریسک کمتری هستید میتوانید کمترین قیمت کندل قبلی را به عنوان نقطه استاپ لاست خود در نظر بگیرید.' +
                '\n' +
                'حد سود را نیز میتوانیید اولین نقطه مقاومتی در نظر داشته باشید.',
            style: TextStyle(color: Colors.black),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'نقطه خروج وقتی نمایان میشود که هر دو شرط زیر برقرار شود: ' +
                  '\n' +
                  '1- مووینگ اوریج نمایی 3 روزه از بالا مووینگ اوریج ساده 8 روزه را به سمت پایین بشکند. ' +
                  '\n' +
                  '2- خط مکدی خط سیگنال را به سمت پایین قطع کرده باشد',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'بهتر است در این استراتژی نمادهایی را برای خرید نهایی برگزینید که در روند صعودی قرار داشته باشند.' +
                  '\n' +
                  'در صورتی که برخلاف روند وارد معامله شدید؛ حد سود خود را حداکثر  بین 3 تا 10 درصد  قرار دهید . ' +
                  '\n' +
                  'در ضمن سیگنال‌هایی که در ادامه معرفی میشود، اسناپ لاست را کمترین قیمت کندلی که در آن سیگنال صادر شده است قرار داده. همچنین  فاکتور روند حرکتی نماد در نظر گرفته نشده است.',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
