import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/widgets/CustomAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 92, 92, 92),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 61, 61, 61),
          title: const CustomAppBar(),
        ));
  }
}
