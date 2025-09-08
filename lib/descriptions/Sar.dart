import 'package:flutter/material.dart';

class Sar extends StatelessWidget {
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
              'مخفف عبارت Stop And Reverse System' +
                  '\n' +
                  'از این اندیکاتور برای تشخیص جهت روند در یک بازار روند دار استفاده میشود.' +
                  '\n' +
                  'زمانیکه نقطه چین‌ها بالای کندلهای قیمت باشند و شیب نزولی داشته باشند، روند نزولی است و بالعکس زمانی که در پایین کندل‌های قیمت به شکلی قرار گیرند که شیب صعودی داشته باشند، روند صعودی است.' +
                  '\n',
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
                    AssetImage('assets/images/indicators/charts/sarChart.png'),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'فرمول محاسباتی این اندیکاتور بسیار پیچیده است. اما دو مولفه اصلی در محاسبات این اندیکاتور وجود دارد:' +
                  '\n' +
                  '1- گام افزایشی (Step Increments)' +
                  '\n' +
                  '2- گام آستانه (Maximum Step)' +
                  '\n' +
                  'وقتی روند در حال گسترش است گام‌ها افزایش پیدا میکنند تا به گام آستانه برسند. میزان افزایش هر گام را از طریق مولفه گام افزایشی تعیین میکنیم. بصورت پیش فرض مقدار مولفه گام افزایشی 0.02 میباشد. با افزایش این مقدار حساسیت اندیکاتور بالاتر میرود و با کاهش آن حساسیت اندیکاتور نیز کمتر میشود. توجه داشته باشید که هر چه مولفه گام افزایشی را بزرگتر انتخاب کنید زودتر به مقدار تعیین شده در گام آستانه میرسید و هر چه کوچکتر انتخاب شود دیرتر.' +
                  '\n' +
                  'مقدار پیش فرض برای گام آستانه مقدار 0.2 میباشد. هرچه این میزان را کوچکتر انتخاب کنید حساسیت کمتر و هر چه قدر بزرگتر انتخاب شود حساسیت بیشتر میشود. البته تغییر در مقدار مولفه گام لفزایشی تاثیر بیشتری بر میزان حساسیت اندیکاتور میگذارد.' +
                  '\n' +
                  'از اسیلاتورهای MACD و ADX میتوان در کنار اندیکاتور SAR استفاده نمود.' +
                  '\n',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
