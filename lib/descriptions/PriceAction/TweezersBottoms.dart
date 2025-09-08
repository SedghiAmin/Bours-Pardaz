import 'package:flutter/material.dart';

class TweezersBottoms extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'این الگو در ادامه روند نزولی ظاهر میشود و بیانگر امکان تغییر روند میباشد. ' +
                'الگوی tweezers bottom شامل دو کندل است و زمانی شکل میگیرد که این دو کندل، قیمت‌های Low تقریبا یکسانی داشته باشند. ' +
                'کندل اول در این الگو یک شمع نزولی (قرمز) با بدنه‌ای تقریبا بلند است ولی کندل دوم یک شمع صعودی (سبز) است که اندازه بدنه آن هر اندازه‌ای میتواند داشته باشد. ' +
                '\n',
            style: TextStyle(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image: AssetImage(
                    'assets/images/priceAction/charts/tweezerBottomChart.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
