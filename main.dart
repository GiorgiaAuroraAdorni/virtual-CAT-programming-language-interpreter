import "package:dartx/dartx.dart";
import "package:interpreter/cat_interpreter.dart";

void main(List<String> arguments) {
  // final String pathToFile = join(
  //   dirname(Platform.script.toFilePath()),
  //   "schemas.json",
  // );

  final String json =
      '{"data":[{"index":1,"array":[[0,0,3,3,0,0],[0,0,3,3,0,0],[3,3,3,3,3,3],[3,3,3,3,3,3],[0,0,3,3,0,0],[0,0,3,3,0,0]]}]}';
  final CATInterpreter interpreter = CATInterpreter(json);
  String command = "mirror({paint({green,red},1,square)},vertical)";
  Pair<Results, CatError> result = interpreter.validateOnScheme(command, 6);
  print(result.second);
  List<Cross> states = result.first.getStates;
  List<Pair<int, int>> positions = result.first.getPositions;
  for (final int i in 0.rangeTo(positions.length - 1)) {
    print(positions[i]);
    print(states[i]);
  }
}
