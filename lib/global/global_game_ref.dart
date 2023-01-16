import 'package:flame_trial/main_game.dart';
import 'package:get/get.dart';

class GlobalGameRef {
  late MainGame gameRef;

  static GlobalGameRef get instance {
    return Get.put(GlobalGameRef());
  }
}
