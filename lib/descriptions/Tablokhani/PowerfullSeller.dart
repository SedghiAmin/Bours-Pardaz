import 'package:flutter/material.dart';

class PowerfullSeller extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Text(
        'با استفاده از این فیلتر، نمادهایی که در آنها نسبت «سرانه فروش هر فرد حقیقی» به «سرانه خرید هر فرد حقیقی» بیشتر باشد را نمایش میدهیم.' +
            '\n\n' +
            'سرانه فروش حقیقی: مجموع حجم فروش حقیقی تقسیم بر تعداد فروشنده حقیقی\n' +
            'سرانه خرید حقیقی: مجموع حجم خرید حقیقی تقسیم بر تعداد خریدار حقیقی\n\n' +
            'از تقسیم سرانه فروش بر سرانه خرید میتوان به قدرت فروشندگان در آن نماد پی برد. هر چقدر این عدد بزرگتر باشد قدرت فروشندگان نیز بیشتر است.',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
