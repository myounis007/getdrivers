import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;
  final bool isLoading;

  const ButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
     this.color,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.05,
      width: width * 0.7,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: isLoading ? null : onTap,
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
