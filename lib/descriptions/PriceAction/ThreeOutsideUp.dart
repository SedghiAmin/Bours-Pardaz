import 'package:flutter/material.dart';

class ThreeOutsideUp extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الگوی سه شمع بیرونی "صعودی" در پایان روند نزولی ظاهر میشود و بیانگر تغییر روند بازار است. ' +
                'این الگو از سه کندل تشکیل شده و به نوعی میتوان آن را تاییدیه الگوی پوشای صعودی دانست که کندل سوم در آن نقش تایید کننده را بازی میکند.' +
                '\n',
            style: TextStyle(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image: AssetImage(
                    'assets/images/priceAction/charts/threeOutsideUpChart.png'),
              ),
            ),
          ),
          Text(
            '\n' + 'مشخصات الگو:',
            style: TextStyle(color: Color(0xff085479)),
          ),
          Text(
            '1- در پایان روند نزولی ظاهر میشود.' +
                '\n' +
                '2- شمع اول نزولی (قرمز) است. ' +
                '\n' +
                '3- شمع دوم صودی (سبز) با بدنه‌ای بلند است که تمام بدنه شمع اول (بهتر است سایه ها را نیز دربرگیرد) را در خود جای داده است.' +
                '\n' +
                '4- شمع سوم نیز یک کندل صعودی (سبز) است که  قیمت Close آن بالاتر از قیمت High در کندل دوم است. ' +
                '\n\n' +
                'این الگو یکی از با اهمیت‌‌ ترین الگوهای خرید است، که سیگنال‌های معتبری را صادر میکند، اما باید توجه داشت که برای تایید سیگنال‌ها میبایست از خروجی سایر الگوها و اندیکاتورها نیز استفاده شود.',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
