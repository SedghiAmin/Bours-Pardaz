import 'package:flutter/material.dart';

class SafeKharid extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Text(
        'با استفاده از این فیلتر نمادهایی که دارای شرایط زیر باشند را نمایش میدهیم:' +
            '\n\n' +
            '1- مجموع درخواست‌ خرید در سه ردیف اول (حجم تقاضا) بیشتر از مجموع سفارش فروش در سه ردیف اول (حجم عرضه) باشد.' +
            '\n' +
            '2- آخرین قیمت بیشتر از قیمت پایانی باشد.' +
            '\n' +
            '3- آخرین قیمت در حوالی آستانه بالاترین قیمت ممکن در روز باشد.' +
            '\n' +
            '4- حجم معاملاتی روز جاری بیشتر از حجم مبنا باشد.' +
            '\n\n' +
            '',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
