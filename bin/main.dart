import "dart:io";

import 'package:dartx/dartx.dart';
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
  const String command =
      "PAINT({blue}, 2, right), GO(D1), PAINT({blue}, 2, right), GO(F3), PAINT({blue})";
  interpreter.validateOnScheme(command, 2);
  // while (true) {
  //   final String? line = stdin.readLineSync(encoding: utf8);
  //   print(line);
  //   final String command = line.toString();
  //   interpreter.validateOnScheme(command, schema);
  // }
}
