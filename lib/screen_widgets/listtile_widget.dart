import 'package:flutter/material.dart';
Widget listTileWidget(
  String title,
  IconData leading,
  IconData trailing,
  VoidCallback onTap
){

  return    ListTile(leading: Icon(leading),
        title: Text(title),
        trailing: Icon(trailing),
        onTap: onTap,
         contentPadding: const EdgeInsets.symmetric(horizontal: 10),
         isThreeLine: false,
         minVerticalPadding: 0,
         visualDensity: VisualDensity.compact,
        );
}