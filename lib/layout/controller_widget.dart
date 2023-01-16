import 'dart:developer';

import 'package:flame_trial/global/global_game_ref.dart';
import 'package:flame_trial/global/player_data.dart';
import 'package:flame_trial/widgets/controller_button_widget.dart';
import 'package:flutter/material.dart';

class ControllerWidget extends StatelessWidget {
  const ControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PlayerData playerData = GlobalGameRef.instance.gameRef.worldData.playerData;

    return Positioned(
      bottom: 100,
      left: 20,
      child: Row(
        children: [
          ControllerButtonWidget(
            path: "assets/controller/left_button.png",
            onPressed: () {
              playerData.componentMotionState =
                  ComponentMotionState.walkingLeft;
            },
          ),
          ControllerButtonWidget(
            path: "assets/controller/center_button.png",
            onPressed: () {
              log("center button pressed");
            },
          ),
          ControllerButtonWidget(
            path: "assets/controller/right_button.png",
            onPressed: () {
              playerData.componentMotionState =
                  ComponentMotionState.walkingRight;
            },
          )
        ],
      ),
    );
  }
}
