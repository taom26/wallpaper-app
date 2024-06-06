// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class WallpaperPreviewScreen extends StatefulWidget {
  final String imageUrl;

  const WallpaperPreviewScreen({super.key, required this.imageUrl});

  @override
  _WallpaperPreviewScreenState createState() => _WallpaperPreviewScreenState();
}

class _WallpaperPreviewScreenState extends State<WallpaperPreviewScreen> {
  final GlobalKey _previewContainerKey = GlobalKey();

  Future<void> _applyWallpaper() async {
    try {
      var status = await Permission.manageExternalStorage.request();
      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permiso de almacenamiento denegado')),
        );
        return;
      }

      final String filePath = await _downloadImage(widget.imageUrl);

      bool result = await WallpaperManager.setWallpaperFromFile(
          filePath, WallpaperManager.HOME_SCREEN);

      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Wallpaper applied successfully!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to apply wallpaper: $e')),
      );
    }
  }

  Future<String> _downloadImage(String url) async {
    final directory = await getExternalStorageDirectory();
    final path = directory?.path;
    final filePath = '$path/wallpaper.jpg';

    Dio dio = Dio();
    await dio.download(url, filePath);

    return filePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Wallpaper'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              key: _previewContainerKey,
              color: Colors.black,
              child: InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(20.0),
                minScale: 0.1,
                maxScale: 5.0,
                child: Image.network(widget.imageUrl),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _applyWallpaper,
              child: const Text('Apply Wallpaper'),
            ),
          ),
        ],
      ),
    );
  }
}
