import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  Color backgroundColor() =>
      const Color(0xFFFFFFFF); // Set background color to white
}
