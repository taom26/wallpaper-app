import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:wallpaper_app/views/screens/fullscreen_image_gallery.dart';

class WallpaperCategory extends StatelessWidget {
  final String category;
  final List<String> images;

  const WallpaperCategory({
    super.key,
    required this.category,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 8 / 9,
            enlargeCenterPage: true,
            pageViewKey: PageStorageKey<String>('carousel_slider_$category'),
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
          ),
          items:
              images.map((item) => _buildCarouselItem(context, item)).toList(),
        ),
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullscreenImageGallery(
              images: images,
              initialIndex: images.indexOf(imageUrl),
            ),
          ),
        );
      },
      child: Container(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(imageUrl,
                  fit: BoxFit.cover, width: 1000.0, height: double.infinity),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
