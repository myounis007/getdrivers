import 'package:flutter/material.dart';

// ignore: must_be_immutable
class tab_bar_widget extends StatelessWidget {
  List<Widget> widgets = [];
  tab_bar_widget({
    required this.widgets,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: widgets,
    );
  }
}
