import 'package:flutter/material.dart';

class Tick extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Text(
        'با استفاده از این فیلتر نمادهایی که دارای شرایط زیر باشند را نمایش میدهیم:' +
            '\n\n' +
            '1- اولین قیمت حداقل یک درصد از کمترین قیمت بیشتر باشد.' +
            '\n' +
            '2- آخرین قیمت حداقل 2 درصد از اولین قیمت بیشتر باشد' +
            '\n' +
            '3- آخرین قیمت بزرگتر از قیمت پایانی باشد.' +
            '\n\n',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
