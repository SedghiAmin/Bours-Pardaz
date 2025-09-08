import 'package:flutter/material.dart';

class SusVol extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Text(
        'این فیلتر نمادهایی که حجم معاملات آن دارای حداقل یکی از شرایط زیر باشد را نمایش میدهد: ' +
            '\n\n' +
            '1- میانگین حجم معاملاتی 3 روز اخیر حداقل 2 برابر میانگین حجم معاملاتی یک ماه اخیر باشد.' +
            '\n' +
            '2- میانگین حجم معاملاتی 3 روز اخیر حداقل 2 برابر میانگین حجم معاملاتی دو هفته اخیر باشد.' +
            '\n' +
            '3- میانگین حجم معاملاتی 3 روز اخیر حداقل 2 برابر میانگین حجم معاملاتی یک هفته اخیر باشد.' +
            '\n\n' +
            '',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
