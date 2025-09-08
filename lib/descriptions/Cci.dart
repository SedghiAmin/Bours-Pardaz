import 'package:flutter/material.dart';

class Cci extends StatelessWidget {
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
              'مخفف عبارت Commodity Channel Index',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'این اسیلاتور توسط Donald Lambert ابداع شد. CCI قیمت فعلی سهم را با میانگین قیمت آن در محدوده زمانی مشخص شده (به صورت پیش فرض 20) مقایسه میکند. ' +
                  '\n' +
                  'بازه نوسان CCI بر خلاف سایر اسیلاتورها بدون حد است. البته اغلب در محدوده ۱۰۰+ تا ۱۰۰- در حال نوسان است. وقتی CCI بالای ۱۰۰+ باشد نشان از این دارد که قیمت جاری بالاتر از متوسط قیمت در محدوده زمانی مشخص شده میباشد و اگر پایین تر از ۱۰۰- باشد بالعکس.',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image:
                    AssetImage('assets/images/indicators/charts/cciChart.png'),
              ),
            ),
          ),
          Text(
            'برای استفاده از سیگنال های خرید و فروش این اسیلاتور میتوان از دو استراتژی بهره برد: ' +
                '\n' +
                'در استراتژی اول زمانیکه cci  خط ۱۰۰+ را به سمت بالا میشکند سیگنال خرید صادر میشود و زمانی که خط ۱۰۰-  را به سمت پایین میشکند سیگنال فروش صادر میشود. ' +
                '\n' +
                'در استراتژی دوم از ترکیب خروجی این اندیکاتور در تایم فریم های مختلق استفاده میکنیم. ابتدا با استفاده از نمودار بلند مدت (مانند نمودار ماهیانه)، روند بلند مدت سهم تشخیص داده می شود، سپس از نمودار کوتاه مدت (مانند نمودار روزانه) برای تشخیص پولبک ها و نقاط ورود استفاده می شود. در این استراتژی وقتی نمودار بلند مدت بالای ۱۰۰+ باشد، نشان دهنده روند صعودی است و این روند صعودی تا زمانی که شاخص CCI از ۱۰۰- به سمت پایین حرکت نکند اعتبار دارد. حال در نمودار کوتاه مدت هر گاه CCI خط ۱۰۰- را به سمت بالا بشکند سیگنال خرید محسوب می شود و هر گاه خط ۱۰۰+ زا به سمت پایین بشکند سیگنال فروش صادر میشود.' +
                '(واچ لیست های ارائه شده از این استراتژی استفاده میکند)' +
                '\n' +
                'واگرایی شکل گرفته در این اسیلاتور، یکی از قوی‌ترین سیگنال های CCI می‌باشد.',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
