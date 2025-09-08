import 'package:flutter/material.dart';

class BullishEngulfing extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Column(
        children: [
          Text(
            'Bullish Engulfing یکی از مهمترین الگوهای بازگشت روند از نزولی به صعودی است. یعنی در انتهای روند نزولی ظاهر گشته و می‌تواند باعث مثبت شدن بازار بشود. ' +
                'این الگو از دو کندل متوالی و مجاور به هم تشکیل شده که اندازه کندل دوم به مراتب بزرگتر از کندل نخست است به گونه‌ای که کل بدنه کندل اول (با رنگ قرمز) به طور کامل درون بدنه کندل دوم (با رنگ سبز) جای می‌گیرد. ' +
                '\n',
            style: TextStyle(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image: AssetImage(
                    'assets/images/priceAction/charts/bullishEngulfingChart.png'),
              ),
            ),
          ),
          Text(
            'شرط لازم برای الگوی پوشای صعودی این است که بدنه کندل دوم بزرگتر از بدنه کندل اول باشد. ' +
                '\n' +
                'کل بدنه کندل اول باید به طور کامل درون بدنه کندل دوم قرار بگیرد اگر چه تا همینجا نیز برای تعریف الگوی پوشای صعودی کافی است؛ اما بهتر است بدنه کندل دوم آنقدر بزرگ باشد که علاوه بر بدنه کندل اول حتی سایه‌های بالای و پایینی آن را نیز درون خودش جای بدهد.' +
                '\n' +
                'همچنین اگر کندل اول این الگو بدنه اصلی خیلی کوچکی داشته باشد و دومین کندل بدنه اصلی خیلی بزرگتری داشته باشد باعث افزایش اعتبار سیگنال‌های این الگو میشود.' +
                '\n' +
                'هشدار: اگر کندل روز بعدی شکل‌گیری این الگو یک کندل سیاه باشد بطوریکه قیمت بسته شدن آن کمتر از پایین‌ترین قیمت الگوی Bullish Engulfing باشد در این صورت یک حرکت نزولی دیگر در تکمیل مسیر قبلی بوجود خواهد آمد.',
            style: TextStyle(color: Color(0xff000000)),
          ),
        ],
      ),
    );
  }
}
