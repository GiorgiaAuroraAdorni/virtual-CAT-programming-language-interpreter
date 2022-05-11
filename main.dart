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
      "MIRROR({GO(up) PAINT({yellow}), GO(right), PAINT({red}), GO(right), PAINT({blue}, 3, up)}, vertical)";
  Pair<Results, CatError> result = interpreter.validateOnScheme(command, 1);
  print(result.second);
  List<Cross> states = result.first.getStates;
  List<Pair<int, int>> positions = result.first.getPositions;
  for (final int i in 0.rangeTo(positions.length - 1)) {
    print(positions[i]);
    print(states[i]);
  }

}
