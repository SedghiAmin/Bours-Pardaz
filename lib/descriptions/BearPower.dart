import 'package:flutter/material.dart';

class BearPower extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'این اسیلاتور یکی از ابداعات و ابزارهای الکساندر الدر است. با استفاده از این اسیلاتور میتوانید قدرت خریداران را با قدرت فروشندگان مقایسه کنید.' +
                  '\n' +
                  'خروجی این اسیلاتور به شکل هیستوگرام نمایش داده میشود که حاصل تفریق کمترین قیمت (Low) در بازه زمانی (به صورت پیش فرض 13 کندلی) و میانگین متحرک نمایی (EMA) در بازه زمانی مشابه میباشد.' +
                  '\n',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 10, top: 10),
            child: Center(
              child: Image(
                image: AssetImage(
                    'assets/images/indicators/charts/bearsChart.png'),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'سیگنال خرید:',
              style: TextStyle(
                color: Color(0xff318d90),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'هرگاه یکی از شرایط زیر مشاهده شود، سیگنال خرید صادر میشود:' +
                  '\n' +
                  '1- هنگامی که بارها از زیر خط صفر شروع به کوتاه شدن میکنند، هشدار تغییر روند را به شما میدهند و در زمانی که به بالای خط صفر رسیدند، سیگنال خرید صادر و تایید میشود (Low > EMA).' +
                  '\n' +
                  '1- هنگامی که بارها از زیر خط صفر شروع به کوتاه شدن میکنند، و جهت حرکت میانگین متحرک نمایی (EMA) نیز به سمت بالا میباشد.' +
                  '\n',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
