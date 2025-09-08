import 'package:flutter/material.dart';

class ThreeInsideUp extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الگوی سه شمع درونی "صعودی" در انتهای حرکت نزولی ظاهر میشود و بیانگر آن است که حرکت فعلی قدرت خود را از دست داده و ممکن است برگشت روندی رخ دهد. این الگو از سه کندل تشکیل شده و به نوعی میتوان آن را تاییدیه الگوی هارامی صعودی دانست که کندل سوم در آن نقش تایید کننده را بازی میکند. ' +
                '\n',
            style: TextStyle(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image: AssetImage(
                    'assets/images/priceAction/charts/threeInsideUpChart.png'),
              ),
            ),
          ),
          Text(
            '\n' + 'مشخصات الگو:',
            style: TextStyle(color: Color(0xff085479)),
          ),
          Text(
            '1- شمع اول نزولی (قرمز) با یک بدنه بلند است. ' +
                '\n' +
                '2- شمع دوم صعودی (سبز) با بدنه‌ای کوچک است که در دل بدنه شمع اول جای گرفته است.' +
                '\n' +
                '3- شمع سوم نیز یک کندل صعودی (سبز) است که  قیمت Close آن بالاتر از قیمت Close در کندل دوم است. ' +
                '\n\n' +
                ' باید توجه داشت که از این الگو همانند الگوی هارامی برای تشخیص پایان اصلاح روند بزرگتر استفاده میشود. ' +
                '\n' +
                'توجه داشته باشید که برای تایید سیگنال‌های این الگو از خروجی سایر الگوها و اندیکاتورها نیز استفاده شود.' +
                '\n',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
