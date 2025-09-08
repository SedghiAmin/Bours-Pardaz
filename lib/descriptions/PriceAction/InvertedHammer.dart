import 'package:flutter/material.dart';

class InvertedHammer extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Column(
        children: [
          Text(
            'الگوی چکش وارونه در پایان یک روند نزولی شکل میگیرد و در صورت تایید منجر به تغییر روند از نزولی  به روند صعودی میشود.' +
                'این الگو یک بدنه کوچک دارد که رنگ آن اهمیت چندانی ندارد. هرچند که اگر بدنه سبز رنگ باشد اعتبار الگو بیشتر است. الگوی چکش وارونه سایه بالایی بسیار بلند دارد که حداقل 2 برابر بدنه کندل است، همچنین سایه پایینی ندارد یا بسیار کوچک است.' +
                '\n',
            style: TextStyle(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image: AssetImage(
                    'assets/images/priceAction/charts/InvertedHammerChart.png'),
              ),
            ),
          ),
          Text(
            'اندل چکش وارونه پس از باز شدن در قیمت ابتدایی، ریزش نمی‌کند و با فشار خرید به سمت بالا می‌رود، اما نمی‌تواند این صعود را حفظ کند و در حوالی قیمت ابتدایی خود بسته می‌شود. اینکه آیا پس از این الگو قیمت برمی‌گردد یا خیر بستگی به کندل بعدی پس از الگو دارد. ' +
                'اگر  کندل روز بعد، بالاتر از بدنه چکش وارونه قرار گیرد، الگوی  تایید میشود. هرچه میزان شکاف بدنه این کندل با بدنه چکش وارونه بیشتر باشد، اعتبار الگوی بیشتر میشود. اما اگر یک کندل صعودی قوی هم مشاهده کردید، می‌تواند دلیل بر تایید الگو باشد، در غیر این صورت الگوی چکش وارونه fail خواهد شد .',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
