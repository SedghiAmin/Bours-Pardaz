import 'package:flutter/material.dart';

class EnterMoney extends StatelessWidget {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 8),
      child: Text(
        'با استفاده از این فیلتر، قیمت پاپانی را در تفاضل « حجم خریداران حقیقی » از « حجم فروشندگان حقیقی » (در صورتیکه مثبت باشد)، ضرب میکنیم تا میزان ورود پول حقیقی را نمایش دهیم. \n' +
            'در این فیلتر نسبت سرانه خرید حقیقی به فروش حقیقی نیز در واچ لیست قرار داده شده است، تا با داده‌های بیشتری به تصمیم گیری بپردازید. \n\n' +
            'سرانه فروش حقیقی: مجموع حجم فروش حقیقی تقسیم بر تعداد فروشنده حقیقی\n' +
            'سرانه خرید حقیقی: مجموع حجم خرید حقیقی تقسیم بر تعداد خریدار حقیقی',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
