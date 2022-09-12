import 'dart:io';

import "package:dartx/dartx.dart";
import "package:interpreter/cat_interpreter.dart";
import 'package:path/path.dart';

void main(List<String> arguments) {
  final String pathToFile = join(
    dirname(Platform.script.toFilePath()),
    "schemas.json",
  );
  File file = File(pathToFile);

  String json = '''
        {
          "data":[
            {
              "index":10,
              "array":[
              [0,0,3,3,0,0],
              [0,0,4,4,0,0],
              [4,3,4,4,3,4],
              [3,4,3,3,4,3],
              [0,0,3,3,0,0],
              [0,0,4,4,0,0]
              ]
            }
          ]
        }''';
  String command =
      """mirror({paint({blue,yellow},:,square),go(C3),paint({blue,blue,yellow,yellow},:,down)},vertical)""";
  CATInterpreter interpreter = CATInterpreter(json);
  Pair<Results, CatError> result = interpreter.validateOnScheme(command, 10);

  print(result.second);
  List<Cross> states = result.first.getStates;
  List<Pair<int, int>> positions = result.first.getPositions;
  for (final int i in 0.rangeTo(positions.length - 1)) {
    print(positions[i]);
    print(states[i]);
  }
  print(result.first.completed);
  print(interpreter.schemes.getData[12]);
}
