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

  final String json =
      '{"data":[{"index":1,"array":[[0,0,3,3,0,0],[0,0,3,3,0,0],[3,3,3,3,3,3],[3,3,3,3,3,3],[0,0,3,3,0,0],[0,0,3,3,0,0]]}]}';
  final CATInterpreter interpreter = CATInterpreter(file.readAsStringSync());
  String command =
      '"GO(D1), PAINT({yellow}), GO(right), PAINT({green}), GO(right), PAINT({blue}), GO(right), PAINT({green}), GO(right), PAINT({blue}), GO(right), PAINT({red}), GO(C1), PAINT({blue}), GO(right), PAINT({red}), GO(right), PAINT({green}), GO(right), PAINT({blue}), GO(right), PAINT({yellow}), GO(right), PAINT({green}), GO(F3), PAINT({blue}), GO(right), PAINT({green}), GO(E3), PAINT({red}), GO(right), PAINT({yellow}), GO(B3), PAINT({yellow}), GO(right), PAINT({red}), GO(A3), PAINT({red}), GO(right), PAINT({yellow})\\n"';
  Pair<Results, CatError> result = interpreter.validateOnScheme(command, 12);
  print(result.second);
  List<Cross> states = result.first.getStates;
  List<Pair<int, int>> positions = result.first.getPositions;
  for (final int i in 0.rangeTo(positions.length - 1)) {
    print(positions[i]);
    print(states[i]);
  }
  print(result.first.completed);
  print(interpreter.schemes.schemas[12]);
}
