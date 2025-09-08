import 'package:flutter/material.dart';

class FinishPositive extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Text(
        'این فیلتر نمادهایی که قیمت پایانی آنها نسبت به قیمت پایانی روز گذشته، مثبت بسته شده است را نمایش میدهد.' + '\n' + 'با استفاده از این فیلتر و مقایسه آن با خروجی فیلتر <آخرین قیمت مثبت> میتوانید از تمایل بازار به روند مثبت یا منفی در روز بعد اطلاع پیدا کنید. اگر تعداد نمادهای که در خروجی فیلتر <آخرین قیمت مثبت> نمایش داده شده بیشتر از تعداد نمادهایی باشد که در خروجی فیلتر <قیمت پایانی مثبت> باشد، نشان از تمایل بازار به ادامه روند در فاز مثبت دارد و اگر بالعکس این موضوع اتفاق افتاده باشد نشان از تمایل بازار به ادامه روند خود به شکل منفی است.' +
            '\n',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
