import 'package:flame/game.dart';
import 'package:flame_trial/layout/game_layout.dart';
import 'package:flame_trial/main_game.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: GameLayout()));
}
