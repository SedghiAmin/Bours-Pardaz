import 'package:flutter/material.dart';

class ThreeWhiteSoldiers extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'این الگو معمولاً پس از یک دوره سکون ظاهر می‌شود و خروج از شرایط رنج را نمایش می‌دهد. ' +
                'البته این الگو را میتوان هم به عنوان الگوی بازگشتی صعودی و هم بعنوان الگوی ادامه دهنده روند صعودی طبقه بندی نمود. ' +
                'اگر این الگو در انتهای یک روند نزولی ظاهر شود بیانگر این است که خریداران موفق شده‌اند بازار را برای سه روز متوالی در دست بگیرند. '
                    '\n',
            style: TextStyle(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image: AssetImage(
                    'assets/images/priceAction/charts/threeWhiteSoldiersChart.png'),
              ),
            ),
          ),
          Text(
            'این الگو شامل سه شمع سفید بلند متوالی است که کندل دوم در محدوده بدنه کندل قبلی باز می‌شود و در بالای کندل اول بسته می‌شود. و کندل سوم نیز به همین صورت در محدوده بدنه کندل دوم باز و در بالای بدنه کندل دوم بسته می‌شود. این کندل‌ها باید بدون سایه بالایی یا دارای سایه‌ی بالایی خیلی کوچک باشند. ' +
                'در صورتی که طول شمع های سفید بیش از حد بلند باشد، باید احتمال رسیدن بازار به منطقه خرید افراطی را در نظر داشت. ' +
                '\n' +
                'الگوی سه سرباز سفید یکی از الگوهای معتبر و قدرتمند است ولی بهتر است که توسط یکی از اندیکاتورها، به عنوان مثال اندیکاتور (RSI) مورد تایید قرار بگیرد. ',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
