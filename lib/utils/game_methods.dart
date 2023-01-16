import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flame_trial/resources/blocks.dart';
import 'package:flame_trial/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GameMethods {
  static GameMethods get instance {
    return GameMethods();
  }

  Vector2 get getBlockSize {
    // return Vector2.all(getScreenSize().width / chunkWidth);
    return Vector2.all(30);

  }

  int get freeArea {
    return (chunkHeight * 0.2.toInt());
  }

  int get maxSecondarySoilExtent{
    return freeArea + 6;
  }

  int get maxThirdSoilExtent{
    return maxSecondarySoilExtent + 6;
  }

  Size getScreenSize() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  }

  Future<SpriteSheet> getBlockSprite() async {
    return SpriteSheet(
        image: await Flame.images
            .load("sprite_sheets/blocks/block_sprite_sheet.png"),
        srcSize: Vector2.all(60));
  }

  Future<Sprite> getSpriteFromBlock(Blocks block) async {
    SpriteSheet spriteSheet = await getBlockSprite();
    return spriteSheet.getSprite(0, block.index);
  }
}
