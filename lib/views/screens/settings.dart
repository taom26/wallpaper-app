import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> marioImages = [
  'https://i.pinimg.com/564x/05/9c/65/059c6510af0bcc7096511c5a71447bd9.jpg',
  'https://i.pinimg.com/564x/64/f5/9f/64f59f2dbb5da050e4a6b7128e0cc7d0.jpg',
  'https://i.pinimg.com/564x/a3/61/2a/a3612ac5e4135db5eee98e8c74ee8503.jpg'
];

final List<String> dragonBallImages = [
  'https://i.pinimg.com/564x/91/3e/3f/913e3fbf46a72424e37ff1b82031287d.jpg',
  'https://i.pinimg.com/736x/ff/8f/57/ff8f57cebf24b785026855817f243af1.jpg',
  'https://i.pinimg.com/564x/ef/9d/74/ef9d74fb676c73e96bbf72af71faa333.jpg'
];

final List<String> carsImages = [
  'https://i.pinimg.com/564x/e7/88/0c/e7880c9e1791917b2aa180f8466bdff1.jpg',
  'https://i.pinimg.com/564x/be/41/9e/be419ef2848147207003aadcb5bdc37a.jpg',
  'https://i.pinimg.com/564x/b5/31/78/b5317860ceef6e17eca011309243af88.jpg'
];

final List<String> aestheticImages = [
  'https://i.pinimg.com/564x/cd/17/f6/cd17f6b8f32740801d233ca71f607632.jpg',
  'https://i.pinimg.com/564x/f6/bf/bc/f6bfbc8fdb2a5b3de5dc597c948ff072.jpg',
  'https://i.pinimg.com/564x/6a/fc/5c/6afc5c43a5050054d7482202e3b75239.jpg'
];

final List<String> moviesImages = [
  'https://i.pinimg.com/564x/e7/25/a5/e725a5f134277a2e26480db498ebdf48.jpg',
  'https://i.pinimg.com/564x/a3/9b/14/a39b14d835001ab7b7d58ff1f906b76f.jpg',
  'https://i.pinimg.com/564x/dd/d0/4e/ddd04eac46d1d15e036d1b4471e26432.jpg'
];
final themeMode = ValueNotifier(2);

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value],
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => const CarouselDemoHome(),
            '/mario': (ctx) => FullscreenSliderDemo(images: marioImages),
            '/dragonball': (ctx) =>
                FullscreenSliderDemo(images: dragonBallImages),
            '/cars': (ctx) => FullscreenSliderDemo(images: carsImages),
            '/aesthetic': (ctx) =>
                FullscreenSliderDemo(images: aestheticImages),
            '/movies': (ctx) => FullscreenSliderDemo(images: moviesImages),
          },
        );
      },
      valueListenable: themeMode,
    );
  }
}

class DemoItem extends StatelessWidget {
  final String title;
  final String route;
  const DemoItem(this.title, this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class CarouselDemoHome extends StatelessWidget {
  const CarouselDemoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        actions: [
          IconButton(
              icon: const Icon(Icons.wallpaper_sharp),
              onPressed: () {
                themeMode.value = themeMode.value == 1 ? 2 : 1;
              })
        ],
      ),
      body: ListView(
        children: const <Widget>[
          DemoItem('Super Mario Bros', '/mario'),
          DemoItem('Dragon Ball Series', '/dragonball'),
          DemoItem('Vehiculos Geniales', '/cars'),
          DemoItem('Imagenes Aesthetic', '/aesthetic'),
          DemoItem('Peliculas Geniales', '/movies'),
        ],
      ),
    );
  }
}

class NoCenterDemo extends StatelessWidget {
  const NoCenterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(title: const Text('Basic demo')),
      body: CarouselSlider(
        options: CarouselOptions(
          disableCenter: true,
        ),
        items: list
            .map((item) => Container(
                  color: Colors.green,
                  child: Text(item.toString()),
                ))
            .toList(),
      ),
    );
  }
}

class FullscreenSliderDemo extends StatelessWidget {
  final List<String> images;

  const FullscreenSliderDemo({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fullscreen sliding carousel demo')),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: false,
            ),
            items: images
                .map((item) => Center(
                        child: Image.network(
                      item,
                      fit: BoxFit.cover,
                      height: height,
                    )))
                .toList(),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const SettingsPage());
}
