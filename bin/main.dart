import "dart:io";

import "package:dartx/dartx.dart";
import "package:path/path.dart";

import "cat_interpreter.dart";

void main(List<String> arguments) {
  // var mormalized = help.splitCommands(
  //   "PAINT({blue}, 2, right) GO(D1) PAINT({blue}, 2, right) GO(F3) PAINT({blue})",
  // );
  // print(mormalized);
  // for (var i in mormalized) {
  //   for (var j in help.splitCommand(i)) {
  //     print(j);
  //   }
  // }
  final String pathToFile = join(
    dirname(Platform.script.toFilePath()),
    "schemas.json",
  );
  final String json = File(pathToFile).readAsStringSync();
  final CATInterpreter interpreter = CATInterpreter(json);
  // for(final Cross i in interpreter.schemes.schemas.values){
  //   print(i);
  //   print("");
  // }
  final int schema = arguments[0].toInt();
  String command =
      "GO(up) PAINT({yellow}), GO(right), PAINT({red}), GO(right), PAINT({blue}, 3, up), MIRROR(horizontal) MIRROR(vertical)";
  print(interpreter.validateOnScheme(command, 4));
  print(interpreter.getStates);
  interpreter.reset();
  command =
      "GO(C6) PAINT({yellow}), GO(left), PAINT({red}), GO(left), PAINT({blue}, 3, down),  MIRROR(vertical) MIRROR(horizontal)";
  print(interpreter.validateOnScheme(command, 4));
  print(interpreter.getStates.last.cross);
  // while (true) {
  //   final String? line = stdin.readLineSync(encoding: utf8);
  //   print(line);
  //   final String command = line.toString();
  //   interpreter.validateOnScheme(command, schema);
  // }
}
