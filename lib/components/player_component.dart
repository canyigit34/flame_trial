import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flame_trial/global/global_game_ref.dart';
import 'package:flame_trial/global/player_data.dart';
import 'package:flame_trial/utils/game_methods.dart';

class PlayerComponent extends SpriteAnimationComponent {
  final double speed = 5;
  bool facingRight = true;
  double stepTime = 0.3;

  Vector2 playerSize = Vector2.all(60);

  late SpriteSheet playerWalkingSpriteSheet;
  late SpriteSheet playerIdleSpriteSheet;

  late SpriteAnimation playerWalkingAnim =
      playerWalkingSpriteSheet.createAnimation(row: 0, stepTime: stepTime);
  late SpriteAnimation playerIdleAnim =
      playerIdleSpriteSheet.createAnimation(row: 0, stepTime: stepTime);

  Future<void> onLoad() async {
    super.onLoad();
    playerWalkingSpriteSheet = SpriteSheet(
        image: await Flame.images
            .load("sprite_sheets/player/player_walking_sprite_sheet.png"),
        srcSize: playerSize);

    playerIdleSpriteSheet = SpriteSheet(
        image: await Flame.images
            .load("sprite_sheets/player/player_idle_sprite_sheet.png"),
        srcSize: playerSize);
    position = Vector2(100, 100);
    animation = playerIdleAnim;
    priority = 100;
    anchor = Anchor.bottomCenter;
  }

  @override
  void onGameResize(Vector2 gameWindowSize) {
    super.onGameResize(gameWindowSize);
    size = GameMethods.instance.getBlockSize * 1.5;
  }

  @override
  void update(double dt) {
    super.update(dt);
    movement();
  }

  void movement() {
    if (GlobalGameRef
            .instance.gameRef.worldData.playerData.componentMotionState ==
        ComponentMotionState.walkingLeft) {
      if (facingRight) {
        flipHorizontallyAroundCenter();
        facingRight = false;
      }
      animation = playerWalkingAnim;
      position.x -= speed;
    }
    if (GlobalGameRef
            .instance.gameRef.worldData.playerData.componentMotionState ==
        ComponentMotionState.walkingRight) {
      if (!facingRight) {
        flipHorizontallyAroundCenter();
        facingRight = true;
      }
      animation = playerWalkingAnim;
      position.x += speed;
    }

    if (GlobalGameRef
            .instance.gameRef.worldData.playerData.componentMotionState ==
        ComponentMotionState.idle) {
      animation = playerIdleAnim;
    }
  }
}
