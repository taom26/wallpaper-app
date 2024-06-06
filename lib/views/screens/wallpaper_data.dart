import 'dart:convert';
import 'package:flutter/services.dart';

class Wallpaper {
  final String url;
  final List<String> tags;

  Wallpaper({required this.url, required this.tags});

  factory Wallpaper.fromJson(Map<String, dynamic> json) {
    return Wallpaper(
      url: json['url'],
      tags: List<String>.from(json['tags']),
    );
  }
}

Future<Map<String, List<String>>> loadWallpapers() async {
  final String response = await rootBundle.loadString('assets/wallpapers.json');
  final List<dynamic> data = json.decode(response);

  List<Wallpaper> wallpapers =
      data.map((item) => Wallpaper.fromJson(item)).toList();

  Map<String, List<String>> categorizedWallpapers = {};

  for (var wallpaper in wallpapers) {
    for (var tag in wallpaper.tags) {
      if (!categorizedWallpapers.containsKey(tag)) {
        categorizedWallpapers[tag] = [];
      }
      categorizedWallpapers[tag]!.add(wallpaper.url);
    }
  }

  return categorizedWallpapers;
}
