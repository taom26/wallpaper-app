import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/widgets/CustomAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(95, 0, 0, 0),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(95, 0, 0, 0),
          title: const CustomAppBar(),
        ));
  }
}
