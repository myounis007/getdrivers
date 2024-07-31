import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/screen_widgets/button_widget.dart';

class PaymentDetailScreen extends StatefulWidget {
  const PaymentDetailScreen({super.key});

  @override
  State<PaymentDetailScreen> createState() => PaymentDetailScreenState();
}

class PaymentDetailScreenState extends State<PaymentDetailScreen> {
  int _paymentMethod = 0;

  String countrySelect = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment details'.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: height * 0.33,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      //color: Colors.white,
                      color: Colors.amber,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      // border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                            child:
                                Text('Turnover for the previous 12 months'.tr)),
                        const Text('USD \$0.00'),
                        const Divider(),
                        Text(
                          'Commission'.tr,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Current commission'.tr),
                            const Text('20.5%')
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Special Commission'.tr,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Urgent'.tr), const Text('5%')],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('9+ Passenger'.tr),
                            const Text('10%')
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Delivery'.tr), const Text('10%')],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Calculation rules'.tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: height * 0.6,
                          width: width,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${'Current commission is'.tr} ${'20.5% '}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.close))
                                  ],
                                ),
                                Text(
                                  'Select a new billing period'.tr,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: height * 0.1,
                                  width: width,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * 0.03,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Radio(
                                                  activeColor:
                                                      Colors.deepPurple,
                                                  value: 1,
                                                  groupValue: _paymentMethod,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _paymentMethod = value!;
                                                    });
                                                  }),
                                              Text('3${'days'.tr}+3.5%'),
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Divider(),
                                        ),
                                        Text(
                                            '${'Payment period: working days:'.tr}3')
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  height: height * 0.1,
                                  width: width,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: height * 0.03,
                                        child: Row(
                                          children: [
                                            Radio(
                                                activeColor: Colors.green,
                                                value: 2,
                                                groupValue: _paymentMethod,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _paymentMethod = value!;
                                                  });
                                                }),
                                            Text('7${'days'.tr}+2.5%'),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: Divider(),
                                      ),
                                      Text(
                                          '${'Payment period: working days:'.tr}7')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                RichText(
                                    text: TextSpan(
                                        style: const TextStyle(
                                            color: Colors.black),
                                        children: [
                                      TextSpan(text: 'Billing period'.tr),
                                      TextSpan(
                                          text: '3${'days'.tr}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: 'will be effective as of'.tr),
                                      const TextSpan(
                                          text: 'Wed,1 \n May.',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ])),
                                Text(
                                    'Our commission per current calculation method will be'
                                        .tr),
                                const Text(
                                  ' 21.5%',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Center(
                                    child: ButtonWidget(
                                        title: 'SAVE'.tr,
                                        onTap: () {},
                                        color: Colors.deepPurple))
                              ],
                            ),
                          ),
                        );
                      });
                },
                decoration:
                    InputDecoration(labelText: 'Current billing period'.tr),
              ),
              TextField(
                onTap: () {
                  showCurrencyPicker(
                    context: context,
                    showFlag: true,
                    showCurrencyName: true,
                    showCurrencyCode: true,
                    onSelect: (Currency currency) {
                      log('${'Select currency'.tr}${currency.name}');
                    },
                  );
                },
                decoration:
                    InputDecoration(labelText: 'Outpayment currency'.tr),
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                  'Choosing the currency different from your bank account currency can imply conversion expenses'
                      .tr),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'To receive payouts, please choose preferable\n payment method and fill in required data'
                    .tr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: height * 0.06,
                width: width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Radio(
                        activeColor: Colors.green,
                        value: 1,
                        groupValue: _paymentMethod,
                        onChanged: (value) {
                          setState(() {
                            _paymentMethod = value!;
                          });
                        }),
                    Container(
                        height: height * 0.034,
                        width: width * 0.08,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Image.asset(
                          'assets/paypal.jpg',
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    const Text('PayPal')
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                height: height * 0.06,
                width: width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Radio(
                        activeColor: Colors.green,
                        value: 2,
                        groupValue: _paymentMethod,
                        onChanged: (value) {
                          setState(() {
                            _paymentMethod = value!;
                          });
                        }),
                    Container(
                        height: height * 0.034,
                        width: width * 0.08,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Image.asset(
                          'assets/payoner.webp',
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    const Text('Payoneer')
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              if (_paymentMethod == 1)
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Email of your PayPal account'.tr),
                ),
              if (_paymentMethod == 2)
                TextFormField(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      onSelect: (Country country) {
                        setState(() {
                          countrySelect = country.name;
                        });
                      },
                    );
                  },
                  decoration: InputDecoration(labelText: 'Bank country'.tr),
                ),
              if (_paymentMethod == 2)
                Text(
                  countrySelect.toString(),
                ),
              SizedBox(
                height: height * 0.02,
              ),
              if (_paymentMethod == 1) Container(),
              if (_paymentMethod == 2)
                Container(
                  height: height * 0.14,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(
                          height: height * 0.035,
                          width: width,
                          child: Image.asset('assets/pay.png')),
                      Text(
                        'Payoneer registration link will be available after\n filling in the registration details and account \n activation'
                            .tr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ButtonWidget(
                    title: 'SAVE'.tr,
                    onTap: () {},
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
