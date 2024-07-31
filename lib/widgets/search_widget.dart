import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchWidget extends StatelessWidget {
  final VoidCallback onClose;
  final ValueChanged<String> onSearch;

  const SearchWidget({
    super.key,
    required this.onClose,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: onSearch,
              decoration: InputDecoration(
                hintText: 'search'.tr,
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: onClose,
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
