import "dart:io";

import "package:dartx/dartx.dart";
import "package:interpreter/cat_interpreter.dart";
import "package:path/path.dart";

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
  // mirror({paint({blue,yellow},:,square),go(C3),paint({blue,blue,yellow,yellow},:,down)},vertical)
  // e3,c5,a3
  const String command =
      """paint({blue,yellow},:,square), copy({c2,c1},{e3,c5,a3,c3})""";
  final CATInterpreter interpreter = CATInterpreter(json, Shape.cross);
  final Pair<Results, CatError> result = interpreter.validateOnScheme(command, 10);

  print(result.second);
  List<BasicShape> states = result.first.getStates;
  List<Pair<int, int>> positions = result.first.getPositions;
  for (final int i in 0.rangeTo(positions.length - 1)) {
    print(positions[i]);
    print(states[i]);
  }
  print(result.first.completed);
  print(interpreter.schemes.getData[12]);
}
