import 'package:flame/components.dart';
import 'package:flame_trial/resources/blocks.dart';
import 'package:flame_trial/utils/game_methods.dart';

class BlockComponent extends SpriteComponent {
  final Blocks block;
  Vector2 blockIndex;

  BlockComponent({required this.block, required this.blockIndex});

  @override
  Future<void>? onLoad() async {
    super.onLoad();

    sprite = await GameMethods.instance.getSpriteFromBlock(block);
  }

  @override
  void onGameResize(Vector2 newGameSize) {
    super.onGameResize(newGameSize);
    size = GameMethods.instance.getBlockSize;
    position = Vector2(GameMethods.instance.getBlockSize.x * blockIndex.x,
        GameMethods.instance.getBlockSize.x * blockIndex.y);
  }
}
