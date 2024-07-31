import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentOfOrdersWidget extends StatefulWidget {
  const PaymentOfOrdersWidget({super.key});

  @override
  State<PaymentOfOrdersWidget> createState() => _PaymentOfOrdersWidgetState();
}

class _PaymentOfOrdersWidgetState extends State<PaymentOfOrdersWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '1- Payments for completed rides are according\n to your billing period and minimum amount\n payable '
                  .tr),
          // Text('payment1'.tr),
          Text(
              '2- Your current comission is displayed on \n payment details tab'
                  .tr),
          // Text('payment2'.tr),
          Text(
              '3- Under our loyalty program, commission fee\n can be reduced based on your rating and 12-\n month turnover on GetTransfer.com'
                  .tr)
          // Text('payment3'.tr)
        ],
      ),
    );
  }
}
