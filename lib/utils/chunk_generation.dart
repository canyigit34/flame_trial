import 'package:fast_noise/fast_noise.dart';
import 'package:flame/game.dart';
import 'package:flame_trial/resources/blocks.dart';
import 'package:flame_trial/utils/constants.dart';
import 'package:flame_trial/utils/game_methods.dart';

class ChunkGeneration {
  static ChunkGeneration get instance {
    return ChunkGeneration();
  }

  List<List<Blocks?>> generateNullChunk() {
    return List.generate(
        chunkHeight, (index) => List.generate(chunkWidth, (index) => null));
  }

  List<List<Blocks?>> generatChunk() {
    List<List<Blocks?>> chunk = generateNullChunk();

    List<List<double>> rawNoise = noise2(chunkWidth, 1,
        noiseType: NoiseType.Perlin, frequency: 0.05, seed: 98756);

    List<int> yValues = getYvaluesFromRawNoise(rawNoise);



    chunk = generatePrimarySoil(chunk,yValues,Blocks.grass);
    chunk = generateSecondarySoil(chunk, yValues, Blocks.dirt);
    chunk =generateStone(chunk, Blocks.stone);

    return chunk;
  }

  List<List<Blocks?>> generatePrimarySoil(List<List<Blocks?>> chunk, List<int> yValues, Blocks block) {

    yValues.asMap().forEach((int index, int val) {
      chunk[val ][index] = block;
      print(chunk[val + GameMethods.instance.freeArea][index]);
    });

  return chunk;
  }

  List<List<Blocks?>> generateSecondarySoil(List<List<Blocks?>> chunk, List<int> yValues, Blocks block) {

    yValues.asMap().forEach((int index, int val) {
      for(int i = val + 1; i <= GameMethods.instance.maxSecondarySoilExtent; i++){
        chunk[i][index] = block;
      }

    });

    return chunk;
  }

  List<List<Blocks?>> generateStone(List<List<Blocks?>> chunk, Blocks block){

    for(int index = 0; index < chunkWidth;index++) {
      for (int i = GameMethods.instance.maxSecondarySoilExtent + 1; i <=
          GameMethods.instance.maxThirdSoilExtent; i++) {
        chunk[i][index] = block;
      }
    }
    return chunk;
  }





  List<int> getYvaluesFromRawNoise(List<List<double>> rawNoise) {
    List<int> yValues = [];

    rawNoise.asMap().forEach((int index, List<double> val) {
      yValues.add((val[0] * 10).toInt().abs() + GameMethods.instance.freeArea);
    });

    return yValues;
  }
}
