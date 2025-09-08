import 'package:flutter/material.dart';

class REE extends StatelessWidget {
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
              'این استراتژی یکی از رایج‌ترین سیستم‌های معاملاتی در بازارهای با روند رنج است.\n ما در این استراتژی از تایم فریم روزانه استفاده میکنیم. \n سیگنال خرید در شرایط زیر صادر میشود:' +
                  '\n' +
                  '1- مووینگ اوریج نمایی 3 روزه از پایین مووینگ اوریج نمایی 8 روزه نمایی را به سمت بالا بشکند. ' +
                  '\n' +
                  '2- خط RSI بالای 50 و در جهت صعودی باشد',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image:
                    AssetImage('assets/images/strategies/charts/REEchart.png'),
              ),
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
              'نقطه خروج وقتی نمایان میشود که یکی از دو شرط زیر برقرار شود: ' +
                  '\n' +
                  '1- مووینگ اوریج نمایی 3 روزه از بالا مووینگ اوریج نمایی 8 روزه نمایی را به سمت پایین بشکند. ' +
                  '\n' +
                  '2- خط RSI زیر عدد 50 قرار گیرد',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'سیگنال‌هایی که در ادامه معرفی میشود، فاکتور روند حرکتی نماد در نظر گرفته نشده است.',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
