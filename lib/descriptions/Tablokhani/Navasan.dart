import 'package:flutter/material.dart';

class Navasan extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Text(
        'با استفاده از این فیلتر نمادهایی که دارای شرایط زیر باشند را نمایش میدهیم:' +
            '\n' +
            '1- اخرین قیمت حداقل یک درصد از قیمت پایانی بیشتر باشد.' +
            '\n' +
            '2- درصد رشد قیمت نهایی مثبت باشد.' +
            '\n' +
            '3- حجم معاملات روز نماد بزرگتر از میانگین حجم سه ماهه نماد باشد.' +
            '\n' +
            '',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
