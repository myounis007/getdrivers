import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  Color? color;
  LoginButton(
      {super.key,
      this.color = Colors.deepPurpleAccent,
      required this.title,
      required this.onTap,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 0.055,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )),
      ),
    );
  }
}
