import 'package:flutter/material.dart';

class Ac extends StatelessWidget {
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
              'مخفف عبارت Accelerator Oscillator' +
                  '\n' +
                  'وظیفه این اسیلاتور اندازه‌گیری مومنتوم قیمتی میباشد. به عبارت ساده تر با استفاده از این ابزار افزایش یا کاهش شتاب حرکت قیمت را بررسی میکنیم.' +
                  '\n' +
                  'از این اندیکاتور در بازارهای روند‌دار (چه صعودی و چه نزولی) استفاده نمایید.' +
                  '\n' +
                  'این اسیلاتور یکی از ابداعات و ابزارهای بیل ویلیامز است.' +
                  '\n',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image:
                    AssetImage('assets/images/indicators/charts/acChart.png'),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'چگونه سیگنال بگیریم؟',
              style: TextStyle(color: Color(0xff085479)),
            ),
          ),
          Text(
            'زمانی که میله های قرمز مشاهده میکنید نشان از نزولی شدن نمودار و زمانی که میله های سبز مشاهده میکنید نشان از صعودی شدن نمودار میباشد ولی جایگاه این میله ها است که سیگنال معتبری به شما میدهد ، اگر میله قرمز از بالای خط صفر به پایین خط صفر آمد نشان از کاهش قیمت و نزولی شدن نمودار است و سیگنال فروش میگیریم و دقیقا برعکس آن هنگامی که میله سبز از زیر خط صفر به بالای خط آمد سیگنال خرید خواهیم گرفت.',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
