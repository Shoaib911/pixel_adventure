import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:pixel_adventure/actors/player.dart';

class Level extends World {
  final String levelName;
  Level({required this.levelName});
  late TiledComponent level;

  @override
  FutureOr<void> onLoad() async {
    level = await TiledComponent.load('$levelName.tmx', Vector2.all(16));

    add(level);

    final spawnPointLayer = level.tileMap.getLayer<ObjectGroup>('Spawnpoints');

    for (final spawnpoint in spawnPointLayer!.objects) {
      switch (spawnpoint.class_) {
        case 'Player':
          final player = Player(
              position: Vector2(spawnpoint.x, spawnpoint.y),
              character: 'Mask Dude');
          add(player);
          break;
        default:
      }
    }

    return super.onLoad();
  }
}
