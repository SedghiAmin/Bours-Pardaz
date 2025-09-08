import 'package:flutter/material.dart';

class Adx extends StatelessWidget {
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
              'مخفف عبارت Average Directional Movement Index' +
                  '\n'
                      'از اندیکاتور شاخص میانگین حرکت جهت‌دار(ADX) برای اندازه گیری قدرت روند و نیز تشخیص  وجود یا عدم وجود روند استفاده میشود. ' +
                  '\n' +
                  'اندیکاتور ADX از سه جزء اصلی به صورت زیر تشکیل شده است:' +
                  '\n' +
                  '+DI : اندیکاتور جهت دار مثبت' +
                  '\n' +
                  '-DI : اندیکاتور جهت دار منفی' +
                  '\n' +
                  'ADX : شاخص میانگین جهت دار' +
                  '\n',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image:
                    AssetImage('assets/images/indicators/charts/adxChart.png'),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'برای تشخیص وجود روند یا عدم وجود آن در بازار، باید از خط ADX استفاده نمود. به طور کلی مقادیری که خط ADX می تواند اتخاذ کند به شرح ذیل است:',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '- بین 0 - 25: روند ضعیف یا بدون روند' +
                  '\n' +
                  'بین 25 تا 50: روند قدرتمند' +
                  '\n' +
                  'بین 50 تا 75: روند بسیار قدرتمند' +
                  '\n' +
                  'بین 75 تا 100: روند فوق العاده قدرتمند ' +
                  '\n',
              style: TextStyle(color: Color(0xff085479)),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'در حالت کلی خط های DI مشخص کننده روند نزولی یا صعودی  هستند. وقتی خط di+ بالای خط di- باشد نشان دهنده روند صعودی سهم است. ولی روند صعودی وقتی تایید می‌شود که خط di+ بالای خط ۲۵ قرار داشته باشد.' +
                  '\n' +
                  'سیگنال خرید در بورس با این اسیلاتور با دو قانون مهم صادر می‌شود. هر سهم باید هر دو قانون را داشته باشد تا بتوان سیگنال خرید به حساب آورد:',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '۱- خط di+ بالای خط di- قرار داشته باشد و بتواند خط ۲۵ را به سمت بالا بشکاند.' +
                  '\n' +
                  '۲- خط adx بالای خط ۲۵ قرار داشته باشد.' +
                  '\n',
              style: TextStyle(color: Color(0xff085479)),
            ),
          ),
          Text(
            'زمانیکه ADX بیشتر از 30 کندل مقداری زیر عدد 25 داشته باشد، نشان دهنده ورود حرکت قیمتی به حالت رنج یا خنثی را دارد. در این حالت بهترین زمان برای نوسانگیری شکل میگیرد و شما میتوانید به خرید و فروش در حمایتها، مقاومتها و نیز بر اساس الگوهای قیمتی بپردازید.' +
                '\n\n' +
                'هر چند از اندیکاتور ADX برای مشخص کردن وجود روند یا عدم وجود آن استفاده می شود اما این اندیکاتور ابزار مناسبی برای تشخیص اینکه روند صعودی یا نزولی است، نمی باشد و بهتر است برای تشخیص جهت روند از ابزارهای دیگر در کنار ADX استفاده شود.' +
                '\n' +
                'از اندیکاتور هایی که می‌توان در کنار ADX به کار برد می‌توان به اندیکاتور سار (Parabolic SAR) و مووینگ اوریج ها(Moving Averages) اشاره نمود.' +
                '\n' +
                'از دیگر کاربردهای این اندیکاتور تشخیص واگرایی در حرکت قیمتی است.',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
