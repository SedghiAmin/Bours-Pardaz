import 'package:flutter/material.dart';

class BullishHarami extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Column(
        children: [
          Text(
            'این الگو از دسته الگوهای دو کندلی به شمار می‌آید که در انتهای روندهای نزولی می‌توان یافت. ' +
                'کندل اول بدنه مشکی (نزولی) دارد که تمامی بدنه شمع دوم را پوشش می دهد. ' +
                'نکته ای که باید در نظر گرفت این است که رنگ بدنه کندل دوم مهم نیست' +
                '\n',
            style: TextStyle(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image: AssetImage(
                    'assets/images/priceAction/charts/bullishHaramiChart.png'),
              ),
            ),
          ),
          Text(
            'اعتبار این الگو در موارد زیر بیشتر است: ' +
                '\n' +
                '۱- هرچه بدنه کندل دوم کوچکتر باشد' +
                '\n' +
                '۲- خارج نشدن سایه‌های شمع دوم از محدوده سایه های کندل اول (نزولی)' +
                '\n' +
                'اگر شمع دوم به صورت دوجی ظاهر شود منجر به تشکیل Bullish Harami Cross (صلیب هارامی صعودی) میشود که از درجه اعتبار بالاتری برخوردار است. ' +
                '\n' +
                'توجه داشته باشید که ظهور الگوی هارامی بیش از آنکه بیانگر تغییر روند باشد، نشان‌دهنده یک ترمز در روند بازار است.' +
                '\n',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
