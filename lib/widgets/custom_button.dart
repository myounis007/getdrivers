import 'package:flutter/material.dart';

class CustomContinueButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const CustomContinueButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          // margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(26.0),
            boxShadow: const [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(width: 12.0),
              Text(
                label,
                style: const TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
