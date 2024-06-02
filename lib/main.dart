import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/screens/home.dart';

void main() {
  runApp(const MyApp());
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
      )
      home: HomeScreen(),
    );
  }
}



/*-----Barra de navegacion-----Color picker-----Sprite walking-----Config page (Empty)*/
/* 
import 'package:flame/components.dart';
import "package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart";
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

/// Flutter code sample for [NavigationDrawer].

void main() => runApp(const NavigationDrawerApp());

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination('Colores', Icon(Icons.palette_outlined), Icon(Icons.palette)),
  ExampleDestination('PJ Bounce', Icon(Icons.android_outlined), Icon(Icons.android)),
  ExampleDestination('Wallpapers', Icon(Icons.wallpaper_outlined), Icon(Icons.wallpaper)),
];

class NavigationDrawerApp extends StatelessWidget {
  const NavigationDrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const NavigationDrawerExample(),
    );
  }
}

class NavigationDrawerExample extends StatefulWidget {
  const NavigationDrawerExample({super.key});

  @override
  State<NavigationDrawerExample> createState() => _NavigationDrawerExampleState();
}

class _NavigationDrawerExampleState extends State<NavigationDrawerExample> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int screenIndex = 0;
  late bool showNavigationDrawer;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  // Define the different pages
  final List<Widget> pages = [
    const HomePage(),
    const TrendingPage(),
    const SettingsPage(),
  ];

  Widget buildBottomBarScaffold() {
    return Scaffold(
      body: pages[screenIndex], // Display the selected page
      bottomNavigationBar: NavigationBar(
        selectedIndex: screenIndex,
        onDestinationSelected: (int index) {
          setState(() {
            screenIndex = index;
          });
        },
        destinations: destinations.map((ExampleDestination destination) {
          return NavigationDestination(
            label: destination.label,
            icon: destination.icon,
            selectedIcon: destination.selectedIcon,
            tooltip: destination.label,
          );
        }).toList(),
      ),
    );
  }

  Widget buildDrawerScaffold(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        bottom: false,
        top: false,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: NavigationRail(
                minWidth: 50,
                destinations: destinations.map(
                      (ExampleDestination destination) {
                    return NavigationRailDestination(
                      label: Text(destination.label),
                      icon: destination.icon,
                      selectedIcon: destination.selectedIcon,
                    );
                  },
                ).toList(),
                selectedIndex: screenIndex,
                useIndicator: true,
                onDestinationSelected: (int index) {
                  setState(() {
                    screenIndex = index;
                  });
                },
              ),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: pages[screenIndex], // Display the selected page
            ),
          ],
        ),
      ),
      endDrawer: NavigationDrawer(
        onDestinationSelected: handleScreenChanged,
        selectedIndex: screenIndex,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Header',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          ...destinations.map(
                (ExampleDestination destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showNavigationDrawer = MediaQuery.of(context).size.width >= 450;
  }

  @override
  Widget build(BuildContext context) {
    return showNavigationDrawer ? buildDrawerScaffold(context) : buildBottomBarScaffold();
  }
}

//-----------------------------PAGINA COLOR PICKER------------------------------
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _colorNotifier = ValueNotifier<Color>(Colors.red[700]!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Paleta de colores maybe?',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.red[700],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ValueListenableBuilder<Color>(
                valueListenable: _colorNotifier,
                builder: (_, color, __) {
                  return ColorPicker(
                    color: color,
                    onChanged: (value) {
                      _colorNotifier.value = value;
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//----------------------------FIN PAGINA COLOR PICKER---------------------------



//------------------------------PAGINA PJ BOUNCE--------------------------------
class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Movimiento PJ',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.red[700],
      ),
      body: GameWidget(game: MyGame()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _clickFab(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _clickFab(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("FAB clicked")),
    );
  }
}

class MyGame extends FlameGame {
  late SpriteAnimationComponent okayuMovement;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final spriteSheet = await images.load('Okayu_Movement.png');
    final spriteSize = Vector2(32, 32);
    final animation = SpriteAnimation.fromFrameData(
      spriteSheet,
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.2,
        textureSize: spriteSize,
      ),
    );
    okayuMovement = SpriteAnimationComponent()
      ..animation = animation
      ..size = spriteSize * 4
      ..position = Vector2(100, 100);
    add(okayuMovement);
  }

  @override
  Color backgroundColor() => const Color(0xFFFFFFFF); // Set background color to white
}
//----------------------------FIN PAGINA PJ BOUNCE------------------------------




class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Wallpapers'),
    );
  }
}


//Pagina rara
*/