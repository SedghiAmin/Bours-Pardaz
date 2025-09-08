import 'package:flutter/material.dart';

class TrendUp extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Text(
        'این فیلتر برای نمایش نمادهایی که شرایط زیر را دارند، استفاده میشود:' +
            '\n\n' +
            '1- تعداد روزهای که قیمت پایانی نماد در 5 روز اخیر منفی بوده، بیشتر از 3 روز باشد' +
            '\n' +
            '2- آخرین قیمت از قیمت دیروز بیشتر باشد.' +
            '\n' +
            '3- آخرین قیمت بیشتر از قیمت پایانی باشد.' +
            '\n' +
            '4- حجم معاملاتی بیشتری نسبت به میانگین روزهای گذشته داشته باشد..' +
            '\n\n' +
            '',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
