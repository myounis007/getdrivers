// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget searchWidget(VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.only(right: 70, top: 10),
    child: TextField(
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Request'.tr,
          // hintText: 'search1 #'.tr,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          suffixIcon:
              IconButton(onPressed: onPressed, icon: const Icon(Icons.close))),
    ),
  );
}
