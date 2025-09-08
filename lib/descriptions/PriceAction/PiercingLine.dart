import 'package:flutter/material.dart';

class PiercingLine extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'این الگو در انتهای یک روند نزولی ظاهر میشود و از دو کندل متوالی و مجاور به هم تشکیل شده است. کندل اولی نزولی (قرمز) است و کندل دوم صعودی (سبز) است. قیمت Open کندل اول (سبز) پایین تر از قیمت Low کندل دوم (قرمز) قرار میگیرد (کندل جاری از کمترین قیمت کندل قبلی نیز پایین تر باز میشود) اما Close آن از نیمه کندل سیاه قبل بالاتر قرار میگیرد. ' +
                '\n',
            style: TextStyle(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image: AssetImage(
                    'assets/images/priceAction/charts/piercingLineChart.png'),
              ),
            ),
          ),
          Text(
            '\n' +
                'هنگامی که در یک روند نزولی قیمتها به پایین ترین حدود خود میرسند ، این حدود قیمت برای خریداران جذاب شده و رالی خرید در این قیمتهای جذاب توسط آنان شروع میشود که این رالی همزمان باعث بالا رفتن رنج قیمت سهم در آن روز و تشکیل یک الگوی نفوذگر می‌دهد. ' +
                '\n' +
                'هرچه طول بدنه کندل قرمز و متعاقب آن کندل سبز بلندتر باشد ، قدرت بازگشت روند بیشتر خواهد بود' +
                '\n' +
                'هرچه گپ بین کمترین قیمت کندل قرمز و قیمت Open کندل سبز بیشتر باشد ،اعتبار الگو بیشتر خواهد بود.' +
                '\n' +
                'هرچه قیمت Close کندل سبز بالاتر از میانه کندل قرمز قرار بگیرد، بازگشت روند قدرتمندتر خواهد بود. ' +
                '\n' +
                'افزایش حجم در خلال تشکیل کندل سبز، تایید کننده این الگو می باشد.' +
                '\n',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'هشدار: ',
            style: TextStyle(color: Color(0xff085479)),
          ),
          Text(
            ' اگر کندل روز بعدی شکل‌گیری این الگو یک کندل نزولی (قرمز) باشد بطوریکه قیمت Close آن کمتر از Low کندل قبل باشد در این صورت یک حرکت نزولی دیگر در تکمیل روند قبلی بوجود خواهد آمد. ',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
