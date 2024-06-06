import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/screens/wallpaper_data.dart';
import 'package:wallpaper_app/views/widgets/carousel.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categorías')),
      body: FutureBuilder<Map<String, List<String>>>(
        future: loadWallpapers(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final categories = snapshot.data!;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (ctx, index) {
                String category = categories.keys.elementAt(index);
                List<String> images = categories[category]!;
                return WallpaperCategory(category: category, images: images);
              },
            );
          }
        },
      ),
    );
  }
}
