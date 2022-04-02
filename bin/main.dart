import "src/helper.dart" as help;

void main(List<String> arguments) {
  var mormalized = help.splitCommands(
    "paint([red], :, up)\n"
    "move(left)\n"
    "paint([blue,yellow], :, down)",
  );
  print(mormalized);
  for (var i in mormalized) {
    for (var j in help.splitCommand(i)) {
      print(j);
    }
  }
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
  // while (true) {
  //   final String? line = stdin.readLineSync(encoding: utf8);
  //   print(line);
  //   final String command = line.toString();
  //   interpreter.validateOnScheme(command, schema);
  // }
}
