import 'dart:html';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_trial/components/block_component.dart';
import 'package:flame_trial/components/player_component.dart';
import 'package:flame_trial/global/global_game_ref.dart';
import 'package:flame_trial/global/world_data.dart';
import 'package:flame_trial/resources/blocks.dart';
import 'package:flame_trial/utils/chunk_generation.dart';
import 'package:get/get.dart';

class MainGame extends FlameGame {
  final WorldData worldData;

  MainGame({required this.worldData}) {
    GlobalGameRef.instance.gameRef = this;
  }

  GlobalGameRef globalGameRef = Get.put(GlobalGameRef());
  PlayerComponent playerComponent = PlayerComponent();

  @override
  Future<void> onLoad() async {
    // globalGameRef.gameRef = this;
    super.onLoad();

    camera.followComponent(playerComponent);
    add(playerComponent);
    renderChunk(ChunkGeneration.instance.generatChunk());
  }

  void renderChunk(List<List<Blocks?>> chunk) {
    chunk.asMap().forEach((yIndex, List<Blocks?> rowOfBlocks) {
      rowOfBlocks.asMap().forEach((xIndex, Blocks? block) {
        if (block != null) {
          add(BlockComponent(
              block: block,
              blockIndex: Vector2(xIndex.toDouble(), yIndex.toDouble())));
        }
      });
    });
  }
}
