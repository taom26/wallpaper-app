import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(children: [
            TextSpan(
                text: "Nombre",
                style: TextStyle(
                    color: Color.fromARGB(255, 165, 155, 17),
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            TextSpan(
                text: "App",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ])),
    );
  }
}
