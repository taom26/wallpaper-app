import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallpaper_app/views/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestPermissions();

  runApp(const MyApp());
}

Future<void> requestPermissions() async {
  var status = await Permission.manageExternalStorage.status;
  if (!status.isGranted) {
    Permission.manageExternalStorage.request();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
