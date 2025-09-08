import 'package:flutter/material.dart';

class Hammer extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Column(
        children: [
          Text(
            'الگوی چکش در پایان یک روند نزولی شکل میگیرد و در صورت تایید منجر به تغییر روند از نزولی  به روند صعودی میشود. ' +
                'این الگو یک بدنه کوچک دارد که رنگ آن اهمیت چندانی ندارد. هرچند که اگر بدنه سبز رنگ باشد اعتبار الگو بیشتر است. الگوی چکش سایه پایینی بسیار بلند دارد که حداقل 2 برابر بدنه کندل است، همچنین سایه بالایی ندارد یا بسیار کوچک است.' +
                '\n',
            style: TextStyle(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20, top: 10),
            child: Center(
              child: Image(
                image: AssetImage(
                    'assets/images/priceAction/charts/hammerChart.png'),
              ),
            ),
          ),
          Text(
            ' کندل چکش پس از باز شدن در قیمت ابتدایی، ریزش می‌کند و با فشار فروش به سمت پایین می‌رود، اما این فشار فروش توسط خریداران کنترل میشود و در نهایت در حوالی قیمت ابتدایی خود بسته می‌شود. اینکه آیا پس از این الگو قیمت برمی‌گردد یا خیر بستگی به کندل بعدی دارد. ' +
                'اگر  کندل روز بعد، بالاتر از بدنه چکش  قرار گیرد، الگوی چکش تایید میشود. هرچه میزان شکاف بدنه این کندل با بدنه چکش بیشتر باشد، اعتبار الگو بیشتر میشود. اما اگر یک کندل صعودی قوی هم مشاهده کردید، می‌تواند دلیل بر تایید الگو باشد، در غیر این صورت الگوی چکش fail خواهد شد .',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
