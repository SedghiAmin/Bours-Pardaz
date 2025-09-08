import 'package:flutter/material.dart';

class MorningStar extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'این الگو در انتهای یک روند نزولی شکل میگیرد که نشان‌دهنده برگشت روند و شروع یک روند صعودی است. ' +
                  'معامله‌گران بعد از مشاهده این الگو  میتوانند از سایر الگوها و اندیکاتورها برای تایید برگشت روند استفاده کنند.' +
                  '\n',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image: AssetImage(
                    'assets/images/priceAction/charts/morningStarChart.png'),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '\n' +
                  '1- شمع اول نزولی (قرمز) با یک بدنه بلند است. ' +
                  '\n' +
                  '2- شمع دوم بدنه‌ای کوچک دارد که اغلب دارای سایه‌هایی بلندی است. بدنه این کندل با بدنه شمع اول هم‌پوشانی ندارد. در ضمن رنگ بدنه آن هم فرقی ندارد.' +
                  '\n' +
                  '3- شمع سوم یک کندل صعودی (سبز) است که به خوبی به نیمه‌های بدنه کندل اول (قرمز) نفوذ کرده است. ' +
                  '\n\n' +
                  'شمع دوم در این الگو بیانگر این است که ظرفیت فروشندگان برای پایین بردن بازار در حال تضعیف است.' +
                  '\n' +
                  'شمع سوم تایید کننده تغییر روند از نزولی به صعودی و پیروزی خریداران است.',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
