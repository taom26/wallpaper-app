import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<String> Anime = [
  'https://cdn.discordapp.com/attachments/904396958737760337/1243223850519625789/20240522_221926.jpg?ex=665de0ef&is=665c8f6f&hm=ff1ae7b89d348a643175b65c82ba2c0a25f6a103253ad2ed78b2eddb72743ce2&',
  'https://cdn.discordapp.com/attachments/904396958737760337/1243223860099158047/20240522_221922.jpg?ex=665de0f2&is=665c8f72&hm=ec9832af0216b2ab18b80b05b5f7fd8a781aa4d7a389039f7693c060b73afaaa&',
  'https://cdn.discordapp.com/attachments/904396958737760337/1243223839995859084/20240522_221924.jpg?ex=665de0ed&is=665c8f6d&hm=ad2b130d9210770bf9caea48133c0a6183fd468b03062f1704f077bbd2f00e61&',
  'https://cdn.discordapp.com/attachments/904396958737760337/1197289241231757342/20240117_161920.jpg?ex=665e337f&is=665ce1ff&hm=857f582968840b1dcab4f595744ca4489e4a18b328946a4993194e113cbbe9d8&'
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
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => CarouselDemoHome(),
            '/nocenter': (ctx) => NoCenterDemo(),
            '/complicated': (ctx) => ComplicatedImageDemo(),
            '/enlarge': (ctx) => EnlargeStrategyDemo(),
            '/manual': (ctx) => ManuallyControlledSlider(),
            '/noloop': (ctx) => NoonLoopingDemo(),
            '/vertical': (ctx) => VerticalSliderDemo(),
            '/fullscreen': (ctx) => FullscreenSliderDemo(),
            '/prefetch': (ctx) => PrefetchImageDemo(),
            '/reason': (ctx) => CarouselChangeReasonDemo(),
            '/position': (ctx) => KeepPageviewPositionDemo(),
            '/multiple': (ctx) => MultipleItemDemo(),
            '/zoom': (ctx) => EnlargeStrategyZoomDemo(),
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
  DemoItem(this.title, this.route);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
        actions: [
          IconButton(
              icon: Icon(Icons.wallpaper_sharp),
              onPressed: () {
                themeMode.value = themeMode.value == 1 ? 2 : 1;
              })
        ],
      ),
      body: ListView(
        children: <Widget>[
          DemoItem('More complicated image slider', '/complicated'),
          DemoItem('Enlarge strategy demo slider', '/enlarge'),
          DemoItem('Manually controlled slider', '/manual'),
          DemoItem('Noon-looping carousel slider', '/noloop'),
          DemoItem('Vertical carousel slider', '/vertical'),
          DemoItem('Fullscreen carousel slider', '/fullscreen'),
          DemoItem('Image carousel slider with prefetch demo', '/prefetch'),
          DemoItem('Carousel change reason demo', '/reason'),
          DemoItem('Keep pageview position demo', '/position'),
          DemoItem('Multiple item in one screen demo', '/multiple'),
          DemoItem('Enlarge strategy: zoom demo', '/zoom'),
        ],
      ),
    );
  }
}

class NoCenterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(title: Text('Basic demo')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          disableCenter: true,
        ),
        items: list
            .map((item) => Container(
                  child: Text(item.toString()),
                  color: Colors.green,
                ))
            .toList(),
      )),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class ComplicatedImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complicated image slider demo')),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: imageSliders,
        ),
      ),
    );
  }
}

class EnlargeStrategyDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complicated image slider demo')),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          items: imageSliders,
        ),
      ),
    );
  }
}

class ManuallyControlledSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ManuallyControlledSliderState();
  }
}

class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Manually controlled slider')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(enlargeCenterPage: true, height: 200),
                carouselController: _controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.previousPage(),
                      child: Text('←'),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.nextPage(),
                      child: Text('→'),
                    ),
                  ),
                  ...Iterable<int>.generate(imgList.length).map(
                    (int pageIndex) => Flexible(
                      child: ElevatedButton(
                        onPressed: () => _controller.animateToPage(pageIndex),
                        child: Text("$pageIndex"),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class NoonLoopingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Noon-looping carousel demo')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 2,
          autoPlay: true,
        ),
        items: imageSliders,
      )),
    );
  }
}

class VerticalSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vertical sliding carousel demo')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.vertical,
          autoPlay: true,
        ),
        items: imageSliders,
      )),
    );
  }
}

Future<void> _saveImage(String imageUrl) async {
  try {
    final response = await http.get(Uri.parse(imageUrl));
    final directory = await getExternalStorageDirectory();
    if (directory != null) {
      final downloadsDir = Directory('${directory.path}/Download');
      await downloadsDir.create(recursive: true);
      final imagePath = '${downloadsDir.path}/image.jpg';
      final file = File(imagePath);
      await file.writeAsBytes(response.bodyBytes);
      print('Imagen guardada con éxito en: $imagePath');

      // Establecer como fondo de pantalla
      final result = await WallpaperManager.setWallpaperFromFile(
          imagePath, WallpaperManager.HOME_SCREEN);
      if (result) {
        print('Imagen establecida como fondo de pantalla con éxito');
      } else {
        print('Error al establecer la imagen como fondo de pantalla');
      }
    } else {
      print('Error: No se pudo acceder al directorio de descargas');
    }
  } catch (e) {
    print('Error al guardar la imagen: $e');
  }
}

class FullscreenSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fullscreen sliding carousel demo')),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: Anime.map((item) => Container(
                  child: Stack(
                    children: [
                      Center(
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          height: height,
                        ),
                      ),
                      Positioned(
                        bottom: 20.0,
                        right: 20.0,
                        child: ElevatedButton(
                          onPressed: () => _saveImage(item),
                          child: Text('Guardar como fondo'),
                        ),
                      ),
                    ],
                  ),
                )).toList(),
          );
        },
      ),
    );
  }
}

class ImagePreviewDialog extends StatefulWidget {
  final String imageUrl;

  ImagePreviewDialog({required this.imageUrl});

  @override
  _ImagePreviewDialogState createState() => _ImagePreviewDialogState();
}

class _ImagePreviewDialogState extends State<ImagePreviewDialog> {
  late double _xOffset;
  late double _yOffset;

  @override
  void initState() {
    super.initState();
    _xOffset = 0.0;
    _yOffset = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Preview'),
      content: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
        child: InteractiveViewer(
          panEnabled: true,
          boundaryMargin: EdgeInsets.all(double.infinity),
          minScale: 0.5,
          maxScale: 5.0,
          child: Image.network(
            widget.imageUrl,
            fit: BoxFit.contain,
            alignment: Alignment(_xOffset, _yOffset),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context); // Cerrar el diálogo de vista previa
            await _applyWallpaper(); // Aplicar la imagen como fondo de pantalla
          },
          child: Text('Aplicar'),
        ),
      ],
    );
  }

  Future<void> _applyWallpaper() async {
    try {
      final response = await http.get(Uri.parse(widget.imageUrl));
      final directory = await getExternalStorageDirectory();
      if (directory != null) {
        final downloadsDir = Directory('${directory.path}/Download');
        await downloadsDir.create(recursive: true);
        final imagePath = '${downloadsDir.path}/image.jpg';
        final file = File(imagePath);
        await file.writeAsBytes(response.bodyBytes);
        print('Imagen guardada con éxito en: $imagePath');

        // Establecer como fondo de pantalla
        final result = await WallpaperManager.setWallpaperFromFile(
            imagePath, WallpaperManager.HOME_SCREEN);
        if (result) {
          print('Imagen establecida como fondo de pantalla con éxito');
        } else {
          print('Error al establecer la imagen como fondo de pantalla');
        }
      } else {
        print('Error: No se pudo acceder al directorio de descargas');
      }
    } catch (e) {
      print('Error al guardar la imagen: $e');
    }
  }
}

Future<void> _showPreviewDialog(BuildContext context, String imageUrl) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return ImagePreviewDialog(imageUrl: imageUrl);
    },
  );
}

class PrefetchImageDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PrefetchImageDemoState();
  }
}

class _PrefetchImageDemoState extends State<PrefetchImageDemo> {
  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prefetch image slider demo')),
      body: Container(
          child: CarouselSlider.builder(
        itemCount: images.length,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realIdx) {
          return Container(
            child: Center(
                child: Image.network(images[index],
                    fit: BoxFit.cover, width: 1000)),
          );
        },
      )),
    );
  }
}

class CarouselChangeReasonDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselChangeReasonDemoState();
  }
}

class _CarouselChangeReasonDemoState extends State<CarouselChangeReasonDemo> {
  String reason = '';
  final CarouselController _controller = CarouselController();

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      reason = changeReason.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Change reason demo')),
        body: Column(
          children: <Widget>[
            Expanded(
              child: CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  onPageChanged: onPageChange,
                  autoPlay: true,
                ),
                carouselController: _controller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: ElevatedButton(
                    onPressed: () => _controller.previousPage(),
                    child: Text('←'),
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () => _controller.nextPage(),
                    child: Text('→'),
                  ),
                ),
                ...Iterable<int>.generate(imgList.length).map(
                  (int pageIndex) => Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.animateToPage(pageIndex),
                      child: Text("$pageIndex"),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  Text('page change reason: '),
                  Text(reason),
                ],
              ),
            )
          ],
        ));
  }
}

class KeepPageviewPositionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categorias')),
      body: ListView.builder(itemBuilder: (ctx, index) {
        if (index == 3) {
          return Container(
              child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              pageViewKey: PageStorageKey<String>('carousel_slider'),
            ),
            items: imageSliders,
          ));
        } else {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            color: Colors.blue,
            height: 200,
            child: Center(
              child: Text('other content'),
            ),
          );
        }
      }),
    );
  }
}

class MultipleItemDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multiple item in one slide demo')),
      body: Container(
          child: CarouselSlider.builder(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: false,
          viewportFraction: 1,
        ),
        itemCount: (imgList.length / 3).round(),
        itemBuilder: (context, index, realIdx) {
          final int first = index * 2;
          final int second = first + 1;
          return Row(
            children: [first, second].map((idx) {
              return Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network(imgList[idx], fit: BoxFit.cover),
                ),
              );
            }).toList(),
          );
        },
      )),
    );
  }
}

class EnlargeStrategyZoomDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('enlarge strategy: zoom demo')),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            enlargeFactor: 0.4,
          ),
          items: imageSliders,
        ),
      ),
    );
  }
}
