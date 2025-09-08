import 'package:flutter/material.dart';

class Saat extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Text(
        'فیلتر الگوی ساعت یکی از قابل اطمینان ترن سیگنال‌های نوسانگیری را صادر میکند که در نیم ساعت پایانی بازار بدست می‌آید.' +
            '\n'
                'با استفاده از این فیلتر نمادهایی که دارای شرایط زیر باشند را نمایش میدهیم:' +
            '\n\n' +
            '1- آخرین قیمت حداقل 1.5 درصد از قیمت پایانی بیشتر باشد.' +
            '\n' +
            '2- نماد در صف خرید نباشد.' +
            '\n' +
            '3- حجم معاملاتی نماد بیشتر از حجم مبنا باشد' +
            '\n\n' +
            'در صورتی که در نیم ساعت پایانی بازار، آخرین قیمت سهمی 1.5 درصد بیشتر از قیمت پایانی آن باشد، سهم به احتمال هشتاد درصد فردا مثبت خواهد بود.' +
            '\n' +
            'در صورتی که در نیم ساعت پایانی بازار، آخرین قیمت سهمی 2 درصد بیشتر از قیمت پایانی آن باشد، سهم به احتمال هشتاد درصد فردا صف خرید خواهد بود.',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
