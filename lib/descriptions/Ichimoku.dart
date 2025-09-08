import 'package:flutter/material.dart';

class Ichimoku extends StatelessWidget {
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
              'ایچیموکو مجموعه ای از ابزارهای تحلیل تکنیکال را در اختیار قرار میدهد  که با استفاده از آنها میتوان نقاط حمایت و مقاومت، میزان مومنتوم و جهت حرکت بازار را تشخیص داد.' +
                  '\n' +
                  'این اندیکاتور توسط یک روزنامه نگار ژاپنی به نام Goichi Hosoda در سال 1969 معرفی شده است.',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image: AssetImage(
                    'assets/images/indicators/charts/IchimokuChart.png'),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'اجزای اندیکاتور ایچیموکو:' +
                  '\n' +
                  '۱- چیکو اسپن (Chikou Span):' +
                  '\n' +
                  'همان نمودار خطی ساده است که از اتصال قیمت بسته شدن کندل ها بهم تشکیل شده و به اندازه ۲۶ کندل به سمت چپ انتقال داده شده است.' +
                  '\n' +
                  '۲- تنکان سن (Tenkan-Sen):' +
                  '\n' +
                  'نرخ میانگین بالاترین و پایین ترین قیمت ۹ کندل آخر' +
                  '\n' +
                  '۳- کیجون سن (Kijun-Sen):' +
                  '\n' +
                  'نرخ میانگین بالاترین و پایین ترین قیمت ۲۶ کندل آخر' +
                  '\n' +
                  '۴- سنکو اسپن A :' +
                  '\n' +
                  'میانگین دو خط تنکاسن سن (قرمز) و کیجون سن (آبی) را ۲۶ کندل به سمت راست انتقال می‌دهیم.' +
                  '\n' +
                  'سنکو اسپن B:' +
                  '\n' +
                  'میانگین بالاترین قیمت و پایین‌ترین قیمت در ۵۲ کندل گذشته را به دست آورده  و ۲۶ کندل به سمت راست انتقال می‌دهیم.' +
                  '\n' +
                  '',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'تشخیص روند بازار:',
              style: TextStyle(color: Color(0xff085479)),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '۱- اگر چیکو اسپن بالای نمودار قیمتی باشد: روند صعودی' +
                  '\n' +
                  '۲- اگر چیکو اسپن پایین نمودار قیمتی باشد: روند نزولی' +
                  '\n' +
                  '۳- اگر چیکو اسپن درون نمودار قیمتی یا بسیار به آن نزدیک باشد: روند خنثی' +
                  '\n',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'i- سیگنال خرید/فروش با استفاده از تقاطع تنکان سن و کیجون سن: ',
              style: TextStyle(color: Color(0xff085479)),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '۱- سیگنال خرید: اگر خط تنکان سن از پایین خط کیجون سن را به سمت بالا قطع کند سیگنال خرید صادر میشود.\n زمانیکه این تقاطع داخل ابر کومو یا بالای ابر کومو شکل بگیرد، سیگنال خرید از اعتبار بیشتری برخوردار است.' +
                  '\n' +
                  '۲- سیگنال فروش: اگر خط تنکان سن از بالا خط کیجون سن را به سمت پایین قطع کند سیگنال فروش صادر میشود. \n زمانیکه این تقاطع داخل ابر کومو یا پایین ابر کومو شکل بگیرد، سیگنال فروش از اعتبار بیشتری برخوردار است.' +
                  '\n',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'ii- سیگنال خرید/فروش با استفاده از تقاطع خط قیمت با کیجون سن: ',
              style: TextStyle(color: Color(0xff085479)),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '۱- سیگنال خرید: اگر قیمت از پایین خط کیجون سن را به سمت بالا قطع کند سیگنال خرید صادر میشود.\n اگر اگر این تقاطع داخل ابر کومو یا بالای ابر کومو  شکل بگیرد، سیگنال خرید از اعتبار بیشتری برخوردار خواهد شد.' +
                  '\n' +
                  '۲- سیگنال فروش: اگر قیمت از بالا خط کیجون سن را به سمت پایین قطع کند سیگنال فروش صادر میشود. \اگر اگر این تقاطع داخل ابر کومو یا پایین ابر کومو شکل بگیرد، سیگنال فروش از اعتبار بیشتری برخوردار خواهد شد.' +
                  '\n',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'iii- سیگنال خرید/فروش با استفاده از ابر کومو: ',
              style: TextStyle(color: Color(0xff085479)),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '۱- سیگنال خرید: اگر کندل های قیمت از داخل ابر کومو لبه بالایی ابر را به سمت بالا بشکند سیگنال خرید صادر میشود.' +
                  '\n' +
                  '۲- یگنال فروش: اگر کندل های قیمت از داخل ابر کومو لبه پایینی ابر را به سمت پایین بشکند سیگنال فروش صادر میشود.' +
                  '\n',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'iv- سیگنال خرید/فروش با استفاده از تقاطع خطوط سنکو اسپن: ',
              style: TextStyle(color: Color(0xff085479)),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '۱- سیگنال خرید: اگر سنکو اسپن A از پایین خط سنکو اسپن B را به سمت بالا قطع کند سیگنال خرید صادر میشود. \n  زمانیکه این تقاطع شکل میگیرد، اگر کندل های قیمت داخل ابر کومو یا بالای ابر کومو قرار داشته باشد، سیگنال خرید از اعتبار بیشتری برخوردار خواهد شد.' +
                  '\n' +
                  '۲- یگنال فروش: اگر سنکو اسپن A از بالا خط سنکو اسپن B را به سمت پایین قطع کند سیگنال فروش صادر میشود. \n  زمانیکه این تقاطع شکل میگیرد، اگر کندل های قیمت داخل ابر کومو یا پایین ابر کومو قرار داشته باشد، سیگنال فروش از اعتبار بیشتری برخوردار خواهد شد.' +
                  '\n',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'v- سیگنال خرید/فروش با استفاده از خط چیکو : ',
              style: TextStyle(color: Color(0xff085479)),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '۱- سیگنال خرید: اگر چیکو اسپن از پایین کندل قیمت را به سمت بالا قطع کند سیگنال خرید صادر میشود. \n  زمانیکه این تقاطع شکل میگیرد، اگر کندل قیمت جاری داخل ابر کومو یا بالای ابر کومو قرار داشته باشد، سیگنال خرید از اعتبار بیشتری برخوردار خواهد شد.' +
                  '\n' +
                  '۲- سیگنال فروش: اگر چیکو اسپن از بالا کندل قیمت را به سمت پایین قطع کند سیگنال فروش صادر میشود. \n  زمانیکه این تقاطع شکل میگیرد، اگر کندل قیمت جاری داخل ابر کومو یا پایین ابر کومو قرار داشته باشد، سیگنال خرید از اعتبار بیشتری برخوردار خواهد شد.' +
                  '\n',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'بررسی و تحلیل سنکو اسپن A و سنکو اسپن B (ابر کومو):',
              style: TextStyle(color: Color(0xff085479)),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'بخشی از ابر کومو که در بالا یا پایین نمودار قیمت است، نشان از وضعیت “فعلی” بازار است. همچنین آن بخش از ابر کومو که در سمت راست نمودار قیمت قرار میگیرد، نشانگر وضعیت “آینده” بازار خواهد بود.' +
                  '\n' +
                  'روند “فعلی” بازار چیست؟' +
                  '\n' +
                  'اگر نمودار قیمت بالای ابر کومو باشد: روند صعودی' +
                  '\n' +
                  'اگر نمودار قیمت پایین ابر کومو باشد: روند نزولی' +
                  '\n' +
                  'اگر نمودار قیمت داخل ابر کومو باشد: روند خنثی' +
                  '\n' +
                  'روند “آینده” بازار چیست؟' +
                  '\n' +
                  'اگر سنکو اسپن A بالای سنکو اسپن B باشد: روند صعودی' +
                  '\n' +
                  'اگر سنکو اسپن A پایین سنکو اسپن B باشد: روند نزولی' +
                  '\n' +
                  'اگر سنکو اسپن A برابر با سنکو اسپن B باشد: روند خنثی' +
                  '\n' +
                  '',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
