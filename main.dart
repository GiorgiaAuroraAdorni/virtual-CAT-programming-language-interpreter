import "dart:io";

import "package:dartx/dartx.dart";
import "package:interpreter/cat_interpreter.dart";
import "package:path/path.dart";

void main(List<String> arguments) {

  final String pathToFile = join(
    dirname(Platform.script.toFilePath()),
    "schemas.json",
  );

  final String json = File(pathToFile).readAsStringSync();
  final CATInterpreter interpreter = CATInterpreter(json);
  String command =
      "GO(d1), PAINT({blue}, 5, L right up), GO(f4), PAINT(green, 5, L down right), GO(c1), PAINT(yellow, 5, L right down), GO(a4), PAINT(red, 5, L up right)";
  Pair<Results, CatError> result = interpreter.validateOnScheme(command, 6);
  print(result.second);
  List<Cross> states = result.first.getStates;
  List<Pair<int, int>> positions = result.first.getPositions;
  for (final int i in 0.rangeTo(positions.length - 1)) {
    print(positions[i]);
    print(states[i]);
  }
}
