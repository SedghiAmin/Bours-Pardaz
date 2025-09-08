import 'package:flutter/material.dart';

class YoSen extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Text(
        'در ژاپن به کندل پر قدرت صعودی (سبز) Yo-Sen گفته می‌شود.' +
            '\n' +
            'ژاپنی‌ها تاکید زیادی بر روی نقاط open و close کندل‌ها دارند. زیرا این دو نشان‌دهنده احساسات آن روز معاملاتی هستند. ' +
            '\n' +
            'ژاپنی‌ها ضرب‌المثلی دارند که می‌گوید: اولین ساعت صبح سکان تمام روز است. ' +
            '\n' +
            ' کندل Yo-Sen از نقطه نظر روانشناسی بسیار حائز اهمیت است زیرا نشان‌گر قدرت زیاد در سمت خریداران است.  ' +
            'هر چقدر بدنه این کندل بزرگتر باشد نشان از قدرت بیشتر خریداران در بازار دارد.' +
            '\n'+
            'نام دیگر این کندل مارابوزو (Marubozo) است.',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
