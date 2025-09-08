import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Column(
        children: [
          Text(
            'شکاف قیمت محدوه‌ای از نمودار است که در آن معامله‌ای انجام نشده است.' +
                '\n' +
                'شکاف در روند صعودی: قیمت low با یک گپ نسبت به قیمت high کندل روز قبل شکل می‌گیرد.' +
                '\n' +
                'شکاف در روند نزولی: قیمت high با یک گپ نسبت به قیمت low کندل روز قبل شکل می‌گیرد.' +
                '\n' +
                'مشاهده شکاف در بین کندل‌های تایم‌فریم هفتگی و ماهانه از اهمیت بالایی برخوردار است.',
            style: TextStyle(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image:
                    AssetImage('assets/images/priceAction/charts/gapChart.png'),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'سه نوع شکاف وجود دارد:',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              ' شکاف شکست:',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'این الگوی شکاف در محدوده خطوط مقاومت یا سقف شکل میگیرد و اغلب زمینه‌ساز شروع روند صعودی است. الگوی شکاف‌های شکست با حجم معاملات سنگینی همراه است و در زمان تصحیح روند به صورت محدوده حمایتی عمل میکند.',
            style: TextStyle(color: Colors.black),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'شکاف فرار: ',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'این نوع شکاف در میانه حرکت یک روند شکل می‌گیرد. در روند صعودی علامت تقویت قیمت و در روند نزولی علامت تضعیف قیمت است. الگوی شکاف فرار همانند یک محدوده حمایت در تصحیح بعدی عمل میکند. این نوع از شکاف را شکاف اندازه‌گیری هم مینامند، به این دلیلی که اغلب در وسط حرکت روند شکل می‌گیرد. در واقع با اندازه‌گیری فاصله‌ای که روند از نقطه ابتدایی شروع روند تا به اینجا طی کرده، میتوان فاصله‌ای که تا پایان روند باقی مانده را تخمین زد.',
            style: TextStyle(color: Colors.black),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              'شکاف خستگی: ',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'این نوع شکاف در انتهای روند ظاهر میشود و نشان از تضعیف روند جاری دارد. یک تا سه کندل بعد از شکل‌گیری این شکاف باید انتظار برگشت روند جاری را داشت.' +
                '\n',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'توجه داشته باشید که نوع شکاف در واچ لیست تعیین نشده و شما باید خودتان نوع آن را با توجه به توضیحات ارائه شده، در نمودار تشخیص دهید.',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
