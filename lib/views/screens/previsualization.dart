import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> images;

  ImageCarousel({required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 18 / 19,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      items: images.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Image.network(
                item,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class TrendingPage extends StatelessWidget {
  const TrendingPage({Key? key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previsualizacion de Wallpapers'),
      ),
      body: ImageCarousel(images: [
         'https://i.pinimg.com/564x/05/9c/65/059c6510af0bcc7096511c5a71447bd9.jpg',
  'https://i.pinimg.com/564x/64/f5/9f/64f59f2dbb5da050e4a6b7128e0cc7d0.jpg',
  'https://i.pinimg.com/564x/a3/61/2a/a3612ac5e4135db5eee98e8c74ee8503.jpg',
       'https://i.pinimg.com/564x/91/3e/3f/913e3fbf46a72424e37ff1b82031287d.jpg',
  'https://i.pinimg.com/736x/ff/8f/57/ff8f57cebf24b785026855817f243af1.jpg',
  'https://i.pinimg.com/564x/ef/9d/74/ef9d74fb676c73e96bbf72af71faa333.jpg',
        'https://i.pinimg.com/564x/e7/88/0c/e7880c9e1791917b2aa180f8466bdff1.jpg',
  'https://i.pinimg.com/564x/be/41/9e/be419ef2848147207003aadcb5bdc37a.jpg',
  'https://i.pinimg.com/564x/b5/31/78/b5317860ceef6e17eca011309243af88.jpg',
       'https://i.pinimg.com/564x/cd/17/f6/cd17f6b8f32740801d233ca71f607632.jpg',
  'https://i.pinimg.com/564x/f6/bf/bc/f6bfbc8fdb2a5b3de5dc597c948ff072.jpg',
  'https://i.pinimg.com/564x/6a/fc/5c/6afc5c43a5050054d7482202e3b75239.jpg',
        'https://i.pinimg.com/564x/e7/25/a5/e725a5f134277a2e26480db498ebdf48.jpg',
  'https://i.pinimg.com/564x/a3/9b/14/a39b14d835001ab7b7d58ff1f906b76f.jpg',
  'https://i.pinimg.com/564x/dd/d0/4e/ddd04eac46d1d15e036d1b4471e26432.jpg'
      ]),
      
    );
  }

  
}

void main() {
  runApp(MaterialApp(
    home: TrendingPage(),
  ));
}
