import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  String? _selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Picker'.tr),
        // title: Text('cur1'.tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showCurrencyPicker(
                  context: context,
                  showFlag: true,
                  showCurrencyName: true,
                  showCurrencyCode: true,
                  onSelect: (Currency currency) {
                    setState(() {
                      _selectedCurrency = currency.name;
                    });
                  },
                );
              },
              child: Text('Select Currency'.tr),
              // child: Text('cur2'.tr),
            ),
            if (_selectedCurrency != null)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  '${'Selected currency'.tr}$_selectedCurrency',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
