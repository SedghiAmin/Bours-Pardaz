import 'package:flutter/material.dart';

class PowerfullBuyer extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Text(
        'با استفاده از این فیلتر، نمادهایی که در آنها نسبت «سرانه خرید هر فرد حقیقی» به «سرانه فروش هر فرد حقیقی» بیشتر باشد را نمایش میدهیم.' +
            '\n\n' +
            'سرانه فروش حقیقی: مجموع حجم فروش حقیقی تقسیم بر تعداد فروشنده حقیقی\n' +
            'سرانه خرید حقیقی: مجموع حجم خرید حقیقی تقسیم بر تعداد خریدار حقیقی\n\n' +
            'از تقسیم سرانه خرید بر سرانه فروش میتوان به قدرت خریداران در آن نماد پی برد. هر چقدر این عدد بزرگتر باشد قدرت خریداران نیز بیشتر است.',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
