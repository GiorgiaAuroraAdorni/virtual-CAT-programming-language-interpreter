import "dart:io";

import "package:dartx/dartx.dart";
import "package:path/path.dart";

import "cat_interpreter.dart";
import "errors.dart";
import "results.dart";
import "src/cross.dart";

void main(List<String> arguments) {
  // CallDirections caller = CallDirections();
  // print("Coloring");
  // caller.methodsColor.forEach(print);
  // print("Moves");
  // caller.methodsMove.forEach(print);

  final String pathToFile = join(
    dirname(Platform.script.toFilePath()),
    "schemas.json",
  );

  final String json = File(pathToFile).readAsStringSync();
  final CATInterpreter interpreter = CATInterpreter(json);
  String command = "FILL_EMPTY(blue)";
  Pair<Results, CatError> result = interpreter.validateOnScheme(command, 1);
  print(result.second);
  List<Cross> states = result.first.getStates;
  List<Pair<int, int>> positions = result.first.getPositions;
  for (final int i in 0.rangeTo(positions.length - 1)) {
    print(positions[i]);
    print(states[i]);
  }

  // var mormalized = help.splitCommands(
  //   "PAINT({blue}, 2, right) GO(D1) PAINT({blue}, 2, right) GO(F3) PAINT({blue})",
  // );
  // print(mormalized);
  // for (var i in mormalized) {
  //   for (var j in help.splitCommand(i)) {
  //     print(j);
  //   }
  // }
  // final String pathToFile = join(
  //   dirname(Platform.script.toFilePath()),
  //   "schemas.json",
  // );
  // final String json = File(pathToFile).readAsStringSync();
  // final CATInterpreter interpreter = CATInterpreter(json);
  // // for(final Cross i in interpreter.schemes.schemas.values){
  // //   print(i);
  // //   print("");
  // // }
  // final int schema = arguments[0].toInt();
  // String command =
  //     "GO(up) PAINT({yellow}), GO(right), PAINT({red}), GO(right), PAINT({blue}, 3, up), MIRROR(horizontal) MIRROR(vertical)";
  // Pair<Results, CatError> result = interpreter.validateOnScheme(command, 4);
  // List<Cross> states = result.first.getStates;
  // List<String> commads = result.first.getCommands;
  // List<Pair<int, int>> positions = result.first.getPositions;
  // for (final int i in 0.rangeTo(states.length - 1)) {
  //   print(commads[i]);
  //   print(states[i]);
  //   print(positions[i]);
  // }
  // print(result.first.completed);
  // interpreter.reset();
  // command =
  //     "GO(C6) PAINT({yellow}), GO(left), PAINT({ciao}), GO(left), PAINT({blue}, 3, down), MIRROR(vertical) MIRROR(horizontal)";
  // result = interpreter.validateOnScheme(command, 4);
  // print(result.second);
  // states = result.first.getStates;
  // commads = result.first.getCommands;
  // positions = result.first.getPositions;
  // for (final int i in 0.rangeTo(states.length - 1)) {
  //   print(commads[i]);
  //   print(states[i]);
  //   print(positions[i]);
  // }
  // print(result.first.completed);
  // while (true) {
  //   final String? line = stdin.readLineSync(encoding: utf8);
  //   print(line);
  //   final String command = line.toString();
  //   interpreter.validateOnScheme(command, schema);
  // }
}
