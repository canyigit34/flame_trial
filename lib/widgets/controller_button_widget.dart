import 'dart:developer';

import 'package:flame_trial/global/global_game_ref.dart';
import 'package:flame_trial/global/player_data.dart';
import 'package:flutter/material.dart';

class ControllerButtonWidget extends StatefulWidget {
  final String path;
  final VoidCallback onPressed;
  const ControllerButtonWidget(
      {super.key, required this.path, required this.onPressed});

  @override
  State<ControllerButtonWidget> createState() => _ControllerButtonWidgetState();
}

class _ControllerButtonWidgetState extends State<ControllerButtonWidget> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTapUp: (_) {
          setState(() {
            isPressed = false;
            GlobalGameRef.instance.gameRef.worldData.playerData
                .componentMotionState = ComponentMotionState.idle;
          });
        },
        onTapDown: (_) {
          setState(() {
            isPressed = true;
            widget.onPressed();
          });
        },
        onTapCancel: () {
          setState(() {
            isPressed = false;
            GlobalGameRef.instance.gameRef.worldData.playerData
                .componentMotionState = ComponentMotionState.idle;
          });
        },
        child: Opacity(
          opacity: isPressed ? 0.5 : 0.8,
          child: SizedBox(
              height: width / 17,
              width: width / 17,
              child: Image.asset(widget.path)),
        ),
      ),
    );
  }
}
